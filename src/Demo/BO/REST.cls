Class Demo.BO.REST Extends EnsLib.REST.Operation [ ProcedureBlock ]
{

/// This operation allows you to check if you have acces to Ensemble. <br> - <b>Operate it only in develeopment!</b><br> - It can be operated from a browser as well. <br> - It should show you the IP you are connected from
Method GETHello(pRequest As Demo.REQ.HelloTest, pResponse As Demo.RES.PatientUpdateData) As %Status
{
	Set tStatus = $$$OK
	#dim Err as %Exception.AbstractException
	#dim pHttpResponse as %Net.HttpResponse
	set pResponse=##class(Demo.RES.PatientUpdateData).%New()
	try {
		set pURL 						= ..Adapter.URL_"/HelloTest"
		set pHttpRequestIn				= ##class(%Net.HttpRequest).%New()
		Set pHttpRequestIn.ContentType 	= "application/json"

		set tStatus=..Adapter.SendFormDataArray(.pHttpResponse, "GET", pHttpRequestIn , , , pURL)
		if $$$ISERR(tStatus) {
			set pResponse.Success=0
			set pResponse.ErrorMessage=$system.Status.GetErrorText(tStatus)
			quit
		}		
		If $Isobject(pHttpResponse) {
			if pHttpResponse.StatusCode'=200 {
				set pResponse.Success=0
				set pResponse.ErrorMessage="Status code "_pHttpResponse.StatusCode
				quit
			}
			set pResponse.Success=1
		}
	}
	catch Err {
		set tStatus=Err.AsStatus()
		set pResponse.Success=0
		set pResponse.ErrorMessage=$system.Status.GetErrorText(tStatus)
	}
	Return tStatus
}

/// This method updates the patient data - extracted from HL7 messages
Method POSTUpdatePatientData(pRequest As Demo.REQ.PatientUpdateData, pResponse As Demo.RES.PatientUpdateData) As %Status
{
	Set tStatus = $$$OK
	#dim Err as %Exception.AbstractException
	#dim pHttpResponse as %Net.HttpResponse
	set pResponse=##class(Demo.RES.PatientUpdateData).%New()
	try {
		set pURL 						= ..Adapter.URL_"/PatientUpdateData"
		set pHttpRequestIn				= ##class(%Net.HttpRequest).%New()
		Set pHttpRequestIn.ContentType 	= "application/json"
		
		do pRequest.%JSONExportToStream(pHttpRequestIn.EntityBody)
		set tStatus=..Adapter.SendFormDataArray(.pHttpResponse, "post", pHttpRequestIn , , , pURL)
		if $$$ISERR(tStatus) {
			set pResponse.Success=0
			set pResponse.ErrorMessage=$system.Status.GetErrorText(tStatus)
			quit
		}		
		If $Isobject(pHttpResponse) {
			if pHttpResponse.StatusCode'=200 {
				set pResponse.Success=0
				set pResponse.ErrorMessage="Status code "_pHttpResponse.StatusCode
				quit
			}
			do pResponse.%JSONImport(pHttpResponse.Data)
		}
		
	}
	catch Err {
		set tStatus=Err.AsStatus()
		set pResponse.Success=0
		set pResponse.ErrorMessage=$system.Status.GetErrorText(tStatus)
	}
	Return tStatus
}

XData MessageMap
{
<MapItems>
	<MapItem MessageType="Demo.REQ.HelloTest">
		<Method>GETHello</Method>
	</MapItem>
	<MapItem MessageType="Demo.REQ.PatientUpdateData">
		<Method>POSTUpdatePatientData</Method>
	</MapItem>
</MapItems>
}

}
