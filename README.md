This is a mock example of a production that takes in HL7 messages via a TCP port, processesses them to decide whether they are identical to previous messages or not, and if the latter (assuming it is a valid message) POSTS a JSON message to a REST API Endpoint as well as updates internal tables to maintain patient records.

A simplified image is here:

![Production Diagram 4](https://github.com/Ari-Glikman/POSTHL7toRESTapi/assets/73805987/45816685-f14b-4fd8-92b2-e8e7584a4e81)


The production looks as follows:

![image](https://github.com/Ari-Glikman/POSTHL7toRESTapi/assets/73805987/03957ff9-eb8f-4d80-a437-60b25f7cb1d0)
![image](https://github.com/Ari-Glikman/POSTHL7toRESTapi/assets/73805987/de290cbb-7d8d-45fa-afcb-d35659329a6f)



We can take a peak inside the process via a message trace:
1) The message is received at the TCP Port and fowarded to the router
2) The router processes it via the rules it has (in this case identifies a ORU_R01:2.3 HL7 message and converts it to JSON)
3) The relevant information is forwarded to the Check Message process where it sends out a request to see if the current information already exists

4 & 5) The request in step 3 is received, the table is checked and we send back confirmation that this is a new message

6) We attempt to POST this information to the REST API Endpoint
7) We are informed that the POST received a successfull response
8) The internal table is updated accordingly
   
![image](https://github.com/Ari-Glikman/POSTHL7toRESTapi/assets/73805987/e7324253-a4e1-471e-8714-964c6a201559)


The 'brains' of the operation is the buisness processes. The best part of it all is that it's simple to make! You don't need to spend hours on stackoverflow understanding functions you will never use again like in other systems.
All you do is 'draw' what you want, compile, and we will make that class for you without you needing to intervene.

![image](https://github.com/Ari-Glikman/aidoc-final-mock/assets/73805987/bbf04f15-e73c-42f1-9f89-617873a3ac9e)

Of course, there is lots more scenarios and possibilities, but we just wanted to create a simple example demonstrating some of the possibilities. 

What's that? You want to see another scenario? Okay, let's say your organization receives repeated messages and why would you want to be sending out the same information multiple times?

In that case the BP will identify that the message already exists and not POST it, nor create duplicates in the table:

![image](https://github.com/Ari-Glikman/POSTHL7toRESTapi/assets/73805987/8848f542-07e2-40d0-89a1-fe6a1d4e4eef)

Finally this is our table of our two patients: Morty, Smith, and Rick, Sanchez (no correlation to Smith, Morty or Sanchez, Rick). After multiple updated patient records only the most updated ones are stored in the table (though of course this can be changed as one would want). 

Before:

![image](https://github.com/Ari-Glikman/aidoc-final-mock/assets/73805987/29c02d50-fec9-4b1e-8b7e-7abfb6cdf61d)


After:

![image](https://github.com/Ari-Glikman/aidoc-final-mock/assets/73805987/9043a15d-a4b7-41f3-8ccf-7ea390bea641)

For info about creating the REST Dispatch and Implementation classes check out our colleague, Guillaume Rongier's great repo [here](https://github.com/grongierisc/objectscript-openapi-definition).

Finally, check out Lorenzo Scalese's [repo](https://github.com/lscalese/OpenAPI-Client-Gen/) for creating an IRIS Interoperability Production generator from an OpenAPI Specification. 

Final note: If you would like to run this example on your own environment you must configure where you will be sending the REST API requests to. You can import the code via the XML containing all relevant classes [here](https://github.com/Ari-Glikman/POSTHL7toRESTapi/blob/main/ImportableXML/Production.xml), compile it and configure your POST Patient Buisness Operation. In the example the http server is the same IRIS instance, which configured an endpoint to receive requests, and respond accordingly. You can check out the specification, dispatch, and implementation classes for it [here](https://github.com/Ari-Glikman/POSTHL7toRESTapi/tree/main/src/Demo). If you're looking for a simple way to test the production, you can send HL7 messages over TCP with [this](https://marketplace.visualstudio.com/items?itemName=RobHolme.hl7tools) great VSCode Extension.
