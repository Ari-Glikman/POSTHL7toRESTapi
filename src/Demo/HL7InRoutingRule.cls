/// 
Class Demo.HL7InRoutingRule Extends Ens.Rule.Definition
{

Parameter RuleAssistClass = "EnsLib.HL7.MsgRouter.RuleAssist";

XData RuleDefinition [ XMLNamespace = "http://www.intersystems.com/rule" ]
{
<ruleDefinition alias="" context="EnsLib.HL7.MsgRouter.RoutingEngine" production="Demo.PostHL7toRESTAPI">
<ruleSet name="" effectiveBegin="" effectiveEnd="">
<rule name="Check ORM_O01">
<constraint name="source" value="HL7In"></constraint>
<constraint name="docCategory" value="2.3"></constraint>
<constraint name="docName" value="ORM_O01"></constraint>
<when condition="1" comment="">
<send transform="Demo.Transformations.ORMO01toJSON" target="Check Message"></send>
</when>
</rule>
<rule name="Check ORU_R01" disabled="false">
<constraint name="source" value="HL7In"></constraint>
<constraint name="docCategory" value="2.3"></constraint>
<constraint name="docName" value="ORU_R01"></constraint>
<when condition="1" comment="">
<send transform="Demo.Transformations.ORUR01toJSON" target="Check Message"></send>
</when>
</rule>
</ruleSet>
</ruleDefinition>
}

}
