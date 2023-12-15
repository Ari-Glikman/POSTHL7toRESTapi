Class Demo.Transformations.ORMO01toJSON Extends Ens.DataTransformDTL [ DependsOn = (EnsLib.HL7.Message, Demo.RES.TransformMessage) ]
{

Parameter IGNOREMISSINGSOURCE = 1;

Parameter REPORTERRORS = 1;

Parameter TREATEMPTYREPEATINGFIELDASNULL = 0;

XData DTL [ XMLNamespace = "http://www.intersystems.com/dtl" ]
{
<transform sourceClass='EnsLib.HL7.Message' targetClass='Demo.RES.TransformMessage' sourceDocType='2.3:ORM_O01' create='new' language='objectscript' >
<subtransform class='Demo.Transformations.SubTransforms.MSHtoJSON' targetObj='target' sourceObj='source.{MSH}' />
<subtransform class='Demo.Transformations.SubTransforms.PIDtoJSON' targetObj='target' sourceObj='source.{PIDgrp.PID}' />
</transform>
}

}
