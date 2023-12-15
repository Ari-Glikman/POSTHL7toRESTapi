/// Patient update.
/// Dispatch class defined by RESTSpec in Demo.spec
Class Demo.disp Extends %CSP.REST [ GeneratedBy = Demo.spec.cls, ProcedureBlock ]
{

/// The class containing the RESTSpec which generated this class
Parameter SpecificationClass = "Demo.spec";

/// Ignore any writes done directly by the REST method.
Parameter IgnoreWrites = 1;

/// Default the Content-Type for this application.
Parameter CONTENTTYPE = "application/json";

/// By default convert the input stream to Unicode
Parameter CONVERTINPUTSTREAM = 1;

/// The default response charset is utf-8
Parameter CHARSET = "utf-8";

XData UrlMap [ XMLNamespace = "http://www.intersystems.com/urlmap" ]
{
<Routes>
  <!-- Server availability check -->
  <Route Url="/HelloTest" Method="get" Call="HelloTest"/>
  <!-- Update Patient Data -->
  <Route Url="/PatientUpdateData" Method="post" Call="PatientUpdateData" />
</Routes>
}

/// Server availability check
ClassMethod HelloTest() As %Status
{
    Try {
        Do ##class(%REST.Impl).%SetContentType("plain/text")
        If '##class(%REST.Impl).%CheckAccepts("plain/text") Do ##class(%REST.Impl).%ReportRESTError(..#HTTP406NOTACCEPTABLE,$$$ERROR($$$RESTBadAccepts)) Quit
        Set response=##class(Demo.impl).HelloTest()
        Do ##class(Demo.impl).%WriteResponse(response)
    } Catch (ex) {
        Do ##class(%REST.Impl).%ReportRESTError(..#HTTP500INTERNALSERVERERROR,ex.AsStatus(),$parameter("Demo.impl","ExposeServerExceptions"))
    }
    Quit $$$OK
}

/// Update Patient Data
ClassMethod PatientUpdateData() As %Status
{
    Try {
        If $case(%request.ContentType,"application/json":0,:1) Do ##class(%REST.Impl).%ReportRESTError(..#HTTP415UNSUPPORTEDMEDIATYPE,$$$ERROR($$$RESTContentType,%request.ContentType)) Quit
        Do ##class(%REST.Impl).%SetContentType("application/json")
        If '##class(%REST.Impl).%CheckAccepts("application/json") Do ##class(%REST.Impl).%ReportRESTError(..#HTTP406NOTACCEPTABLE,$$$ERROR($$$RESTBadAccepts)) Quit
        If '$isobject(%request.Content) || (%request.Content.Size=0) Do ##class(%REST.Impl).%ReportRESTError(..#HTTP400BADREQUEST,$$$ERROR($$$RESTRequired,"body")) Quit
        Set pbody=##class(%DynamicAbstractObject).%FromJSON(%request.Content)
        Set response=##class(Demo.impl).PatientUpdateData(pbody)
        Do ##class(Demo.impl).%WriteResponse(response)
    } Catch (ex) {
        Do ##class(%REST.Impl).%ReportRESTError(..#HTTP500INTERNALSERVERERROR,ex.AsStatus(),$parameter("Demo.impl","ExposeServerExceptions"))
    }
    Quit $$$OK
}

}
