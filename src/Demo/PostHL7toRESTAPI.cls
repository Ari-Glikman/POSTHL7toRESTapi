Class Demo.PostHL7toRESTAPI Extends Ens.Production
{

XData ProductionDefinition
{
<Production Name="Demo.PostHL7toRESTAPI" TestingEnabled="true" LogGeneralTraceEvents="false">
  <Description></Description>
  <ActorPoolSize>2</ActorPoolSize>
  <Item Name="HL7In" Category="" ClassName="EnsLib.HL7.Service.TCPService" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="MessageSchemaCategory">2.3</Setting>
    <Setting Target="Host" Name="TargetConfigNames">HL7In_Router</Setting>
    <Setting Target="Adapter" Name="Port">5555</Setting>
  </Item>
  <Item Name="HL7In_Router" Category="" ClassName="EnsLib.HL7.MsgRouter.RoutingEngine" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="BusinessRuleName">Demo.HL7InRoutingRule</Setting>
  </Item>
  <Item Name="Check Table" Category="" ClassName="Demo.BO.CheckTable" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="POST Patient" Category="" ClassName="Demo.BO.REST" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="HTTPPort">52776</Setting>
    <Setting Target="Adapter" Name="HTTPServer">localhost</Setting>
    <Setting Target="Adapter" Name="URL">/demo</Setting>
  </Item>
  <Item Name="Check Message" Category="" ClassName="Demo.BP.CheckMessage" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
</Production>
}

}
