Class Demo.Transformations.ORUR01toJSON Extends Ens.DataTransformDTL [ DependsOn = (EnsLib.HL7.Message, Demo.RES.TransformMessage) ]
{

Parameter IGNOREMISSINGSOURCE = 1;

Parameter REPORTERRORS = 1;

Parameter TREATEMPTYREPEATINGFIELDASNULL = 0;

XData DTL [ XMLNamespace = "http://www.intersystems.com/dtl" ]
{
<transform sourceClass='EnsLib.HL7.Message' targetClass='Demo.RES.TransformMessage' sourceDocType='2.3:ORU_R01' create='new' language='objectscript' >
<foreach property='source.{PIDgrpgrp()}' key='k1' >
<subtransform class='Demo.Transformations.SubTransforms.PIDtoJSON' targetObj='target' sourceObj='source.{PIDgrpgrp(k1).PIDgrp.PID}' />
<subtransform class='Demo.Transformations.SubTransforms.PV1toJSON' targetObj='target' sourceObj='source.{PIDgrpgrp(k1).PIDgrp.PV1grp.PV1}' />
<foreach property='source.{PIDgrpgrp(k1).ORCgrp()}' key='k2' >
<foreach property='source.{PIDgrpgrp(k1).ORCgrp(k2).OBXgrp()}' key='k3' >
<subtransform class='Demo.Transformations.SubTransforms.OBXtoJSON' targetObj='target' sourceObj='source.{PIDgrpgrp(k1).ORCgrp(k2).OBXgrp(k3).OBX}' />
</foreach>
</foreach>
</foreach>
</transform>
}

}
