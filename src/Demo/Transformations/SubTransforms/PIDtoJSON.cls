Class Demo.Transformations.SubTransforms.PIDtoJSON Extends Ens.DataTransformDTL [ DependsOn = (EnsLib.HL7.Segment, Demo.RES.TransformMessage) ]
{

Parameter IGNOREMISSINGSOURCE = 1;

Parameter REPORTERRORS = 1;

Parameter TREATEMPTYREPEATINGFIELDASNULL = 0;

XData DTL [ XMLNamespace = "http://www.intersystems.com/dtl" ]
{
<transform sourceClass='EnsLib.HL7.Segment' targetClass='Demo.RES.TransformMessage' sourceDocType='2.3:PID' targetDocType='2.3:PID' create='existing' language='objectscript' >
<assign value='source.{PatientName.familyname}' property='target.LastName' action='set' />
<assign value='source.{PatientName.givenname}' property='target.FirstName' action='set' />
<if condition='source.{PatientIDExternalID.ID}=""' >
<true>
<assign value='source.{PatientIDInternalID().ID}' property='target.TeudatZehut' action='set' />
</true>
<false>
<assign value='source.{PatientIDExternalID.ID}' property='target.TeudatZehut' action='set' />
</false>
</if>
<assign value='source.{DateofBirth.timeofanevent}' property='target.DateOfBirth' action='set' />
</transform>
}

}
