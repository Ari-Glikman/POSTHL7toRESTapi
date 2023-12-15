/// 
Class Demo.BP.CheckMessage Extends Ens.BusinessProcessBPL
{

/// BPL Definition
XData BPL [ XMLNamespace = "http://www.intersystems.com/bpl" ]
{
<process language='objectscript' request='Demo.REQ.PatientNewData' response='Ens.Response' height='2000' width='2000' >
<context>
<property name='FirstNameOld' type='%String' instantiate='0' >
<parameters>
<parameter name='MAXLEN'  value='50' />
</parameters>
</property>
<property name='LastNameOld' type='%String' instantiate='0' >
<parameters>
<parameter name='MAXLEN'  value='50' />
</parameters>
</property>
<property name='DateOfBirthOld' type='%String' instantiate='0' >
<parameters>
<parameter name='MAXLEN'  value='50' />
</parameters>
</property>
<property name='ObservationOld' type='%String' instantiate='0' >
<parameters>
<parameter name='MAXLEN'  value='50' />
</parameters>
</property>
<property name='PatientClassOld' type='%String' instantiate='0' >
<parameters>
<parameter name='MAXLEN'  value='50' />
</parameters>
</property>
<property name='IDPatientVisitOld' type='%String' instantiate='0' >
<parameters>
<parameter name='MAXLEN'  value='50' />
</parameters>
</property>
<property name='POSTReturn' type='%String' instantiate='0' >
<parameters>
<parameter name='MAXLEN'  value='50' />
</parameters>
</property>
<property name='POSTErrorMsg' type='%String' instantiate='0' >
<parameters>
<parameter name='MAXLEN'  value='50' />
</parameters>
</property>
</context>
<sequence xend='200' yend='1250' >
<trace name='Request Received!' value='"received request for "_request.TeudatZehut' xpos='200' ypos='250' />
<call name='Call Check Table' target='Check Table' async='0' xpos='200' ypos='350' >
<request type='Demo.REQ.PatientNewData' >
<assign property="callrequest.TeudatZehut" value="request.TeudatZehut" action="set" />
</request>
<response type='Demo.RES.PatientInformation' >
<assign property="context.FirstNameOld" value="callresponse.FirstName" action="set" />
<assign property="context.LastNameOld" value="callresponse.LastName" action="set" />
<assign property="context.DateOfBirthOld" value="callresponse.DateOfBirth" action="set" />
<assign property="context.ObservationOld" value="callresponse.Observation" action="set" />
<assign property="context.PatientClassOld" value="callresponse.PatientClass" action="set" />
<assign property="context.IDPatientVisitOld" value="callresponse.IDPatientVisit" action="set" />
</response>
</call>
<if name='Identical Object Exists' condition='(request.FirstName=context.FirstNameOld)&amp;&amp;(request.LastName=context.LastNameOld)&amp;&amp;(request.DateOfBirth=context.DateOfBirthOld)&amp;&amp;(request.Observation=context.ObservationOld)&amp;&amp;(request.PatientClass=context.PatientClassOld)&amp;&amp;(request.IDPatientVisit=context.IDPatientVisitOld)' xpos='200' ypos='450' xend='200' yend='1150' >
<true>
<empty name='Do Nothing' xpos='200' ypos='600' />
<trace name='Identical Message Exists!' value='"Identical Message Exists!"' xpos='200' ypos='700' />
</true>
<false>
<call name='POST' target='POST Patient' async='0' xpos='470' ypos='600' >
<request type='Demo.REQ.PatientUpdateData' >
<assign property="callrequest.PatientFirstName" value="request.FirstName" action="set" />
<assign property="callrequest.PatientLastName" value="request.LastName" action="set" />
<assign property="callrequest.PatientDOB" value="request.DateOfBirth" action="set" />
<assign property="callrequest.PatientId" value="request.TeudatZehut" action="set" />
<assign property="callrequest.PatientClass" value="request.PatientClass" action="set" />
<assign property="callrequest.StudyData" value="request.Observation" action="set" />
<assign property="callrequest.StudyId" value="request.IDPatientVisit" action="set" />
</request>
<response type='Demo.RES.PatientUpdateData' >
<assign property="context.POSTReturn" value="callresponse.Success" action="set" />
<assign property="context.POSTErrorMsg" value="callresponse.ErrorMessage" action="set" />
</response>
</call>
<if name='POST Success' condition='context.POSTReturn' xpos='470' ypos='700' xend='470' yend='1050' >
<true>
<call name='Update Table' target='Check Table' async='0' xpos='470' ypos='850' >
<request type='Demo.REQ.PatientUpdateTable' >
<assign property="callrequest.FirstName" value="request.FirstName" action="set" />
<assign property="callrequest.LastName" value="request.LastName" action="set" />
<assign property="callrequest.DateOfBirth" value="request.DateOfBirth" action="set" />
<assign property="callrequest.TeudatZehut" value="request.TeudatZehut" action="set" />
<assign property="callrequest.PatientClass" value="request.PatientClass" action="set" />
<assign property="callrequest.Observation" value="request.Observation" action="set" />
<assign property="callrequest.IDPatientVisit" value="request.IDPatientVisit" action="set" />
</request>
</call>
</true>
<false>
<empty name='Do Nothing (No Update)' xpos='740' ypos='850' />
<trace name='POST Failed' value='"post failed due to "_context.POSTErrorMsg' xpos='740' ypos='950' />
</false>
</if>
</false>
</if>
</sequence>
</process>
}

Storage Default
{
<Type>%Storage.Persistent</Type>
}

}
