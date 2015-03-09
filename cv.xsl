<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE HTML [
<!ENTITY nbsp "&#160;"><!--espace insécable-->
]>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" encoding="utf-8" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" indent="no" />


<xsl:template match="cv">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>_ Desmidt Clément _ CV _ Curriculum Vitæ</title>

<script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js"></script>
<script type="text/javascript" src="http://shikiryu.com/js/konami.js"></script>
<script type="text/javascript" src="http://shikiryu.com/js/jquery.tipsy.js"></script>
<script type="text/javascript" src="decodingFunction.js"></script>

<link href="main.css" media="screen" rel="Stylesheet" type="text/css" />
<link href="print.css" media="print" rel="Stylesheet" type="text/css" />
<!--[if IE]>
<link href="http://www.shikiryu.com/mainIE.css" rel="Stylesheet" type="text/css" />
<![endif]-->
</head>

<body onload="goDecoding();">
<a href="en.xml" id="en-lang" class="tips" title="English"></a>
<a href="fr.xml" id="fr-lang" class="tips" title="Français"></a>

<div id="wrapper">

<div id="presentation">
<img src="images/ShikiryuPic.png" alt="Photo de Shikiryu" />
<xsl:apply-templates select="presentation" />
</div>

<div id="competences">
<xsl:apply-templates select="competences" />
</div>

<div id="works">
<xsl:apply-templates select="experiences" />
</div>

<div id="formation">
<xsl:apply-templates select="formations" />
</div>

<div id="contact">
<xsl:apply-templates select="contacts" />
</div>

</div>

<script type="text/javascript">
$(document).ready(function(){
$('.tips').tipsy({gravity: $.fn.tipsy.autoNS,fade: true});
$(window).konami(function(){ 
	window.location.href='http://portfolio.shikiryu.com/showreel/showreel-hq.html'
});

$('.decode').html($(this).html());
});
</script>
</body>
</html>
</xsl:template>

<xsl:template match="presentation">
<h2><xsl:value-of select="title" /></h2>
<p>
<strong><xsl:value-of select="naissance/@name" /></strong>&nbsp; <xsl:value-of select="naissance" /><br/>
<xsl:for-each select="sites/site">
<a href="{.}"><xsl:value-of select="@name" /></a> 
<xsl:if test="position() != last()"> - </xsl:if>
</xsl:for-each>
<br/>
<strong><xsl:value-of select="langues/@name" /></strong>
<xsl:for-each select="langues/langue">
 / <strong><xsl:value-of select="@name" /> :&nbsp;</strong> <xsl:value-of select="." /> 
</xsl:for-each>
<br/><br/>
</p>
<p class="telechargement">
<strong><xsl:value-of select="telechargement/@name" /></strong> <a href="{telechargement/fichier[1]}" title="{telechargement/fichier[1]/@name}" class="pdf"><xsl:value-of select="telechargement/fichier[1]/@name" /></a> &nbsp;<xsl:value-of select="telechargement/ou" />&nbsp; <a href="{telechargement/fichier[2]}" title="{telechargement/fichier[2]/@name}" class="word"><xsl:value-of select="telechargement/fichier[2]/@name" /></a>
</p>
</xsl:template>

<xsl:template match="competences">
<h2 class="skills"><xsl:value-of select="@name" /></h2>

<div id="leftComp">
<h3 class="{competence[1]/@class}"><xsl:value-of select="competence[1]/@name" /></h3>
<p>
<xsl:for-each select="competence[1]/detail">
<span name="decode"> <xsl:value-of select="." disable-output-escaping="yes" /></span><br/>
</xsl:for-each>
<br /><br /></p>

<h3 class="{competence[2]/@class}"><xsl:value-of select="competence[2]/@name" /></h3>
<p>
<xsl:for-each select="competence[2]/detail">
<span name="decode"> <xsl:value-of select="." disable-output-escaping="yes" /></span><br/>
</xsl:for-each>
</p>

</div>

<div id="rightComp">
<h3 class="{competence[3]/@class}"><xsl:value-of select="competence[3]/@name" /></h3>
<p>
<xsl:for-each select="competence[3]/detail">
<span name="decode"> <xsl:value-of select="." disable-output-escaping="yes" /></span><br/>
</xsl:for-each>
<br /><br /></p>


<h3 class="{competence[4]/@class}"><xsl:value-of select="competence[4]/@name" /></h3>
<p>
<xsl:for-each select="competence[4]/detail">
<span name="decode"> <xsl:value-of select="." disable-output-escaping="yes" /></span><br/>
</xsl:for-each>
</p>

</div>
</xsl:template>

<xsl:template match="experiences">
<h2><xsl:value-of select="@name" /></h2>
<ul class="proExp">
	<xsl:for-each select="experience">
		<li class="exp"><span class="date"><xsl:value-of select="date" /></span>&nbsp;
		<span class="lieu">
		<xsl:if test="lien = ''">
			<xsl:value-of select="lieu" /> 
		</xsl:if>
		<xsl:if test="lien != ''">
			<a href="{lien}"><xsl:value-of select="lieu" /> </a>
		</xsl:if>
		</span>&nbsp;
		<span class="titre"><xsl:value-of select="titre" />&nbsp;<strong><xsl:value-of select="type" /></strong></span><br/>
		<ul class="missions">
			<xsl:for-each select="missions/mission">
				<li>- <xsl:value-of select="." /></li>
			</xsl:for-each>	
		</ul>
	</li>
	</xsl:for-each>
</ul>
</xsl:template>

<xsl:template match="formations">
<h2><xsl:value-of select="@name" /></h2>
<ul>
	<xsl:for-each select="formation">
	<li><span class="date"><xsl:value-of select="date" /></span>&nbsp;
		<span class="lieu">
		<xsl:if test="lien = ''">
			<xsl:value-of select="lieu" /> 
		</xsl:if>
		<xsl:if test="lien != ''">
			<a href="{lien}"><xsl:value-of select="lieu" /> </a>
		</xsl:if>
		</span>&nbsp;
		<span class="titre"><strong><xsl:value-of select="titre/@name" /></strong> &nbsp;
			<span class="decode" name="decode"><xsl:value-of select="titre" disable-output-escaping="yes" /></span>
		</span>
	</li>
	</xsl:for-each>
</ul>
</xsl:template>

<xsl:template match="contacts">
<div id="Sites">
<h2><xsl:value-of select="contact[1]/@name" /></h2>
<p>
<xsl:for-each select="contact[1]/lien">
	<a href="{.}" title="{@title}" target="_blank" class="{@class}"></a>
</xsl:for-each>	
</p>
</div>
<div id="Forms">
<h2><xsl:value-of select="contact[2]/@name" /></h2>
<p class="contactWays">
<a href="{contact[2]/lien}" class="{contact[2]/lien/@class}"><xsl:value-of select="contact[2]/lien/@texte" /></a><br />
</p>
</div>
</xsl:template>

</xsl:stylesheet>