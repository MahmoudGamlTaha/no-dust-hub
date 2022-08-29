<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
     <script src="resources/assetsnodust/bootstrap/js/jquery-1.8.3.min.js"></script>

 <script type="text/javascript" src="resources/assetsnodust/js/amq_adapter.js"></script> 
<script type="text/javascript" src="resources/assetsnodust/js/mq.js"></script>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<button onclick="test_mq()">Test MQ</button>
<script type="text/javascript">
  var amq = org.activemq.Amq;
  amq.init({ 
    uri: 'amq', 
    logging: true,
    timeout: 20
  });
</script>
<script type="text/javascript">
function test_mq()
{
	amq.sendMessage('ActiveMQ.Advisory.Queue','Test MQ');
}
</script>
</body>
</html>