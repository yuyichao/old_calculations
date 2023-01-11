<%@ page language="java"  %>
<%@ taglib uri="/webMathematica-taglib" prefix="msp" %>


<!--
Created by Wolfram Workbench
-->

<html>
<head>
<title>
try2
</title>
</head>
<body>
<h1>
try2
</h1>
<p>
This page is created to show a webMathematica Form
</p>
<form action="try2.jsp" method="post">

<!--
Loads a Mathematica application
change Get to Needs for final deployment.
-->
<msp:evaluate>
Get[ "try2`"];
</msp:evaluate>

<p>
Computation of Expand[(x+y)^Random[Integer, {0,10}]]
</p>
<msp:evaluate>
Expand[(x+y)^Random[Integer, {0,10}]]
</msp:evaluate>

<br/>
<input type="submit" name="submitButton" value="Evaluate" />
</form>
</body>
</html>
