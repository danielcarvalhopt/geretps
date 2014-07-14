<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:p="http://xml.di.uminho.pt/paragraph2007" xmlns:t="http://xml.di.uminho.pt/test2014" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" exclude-result-prefixes="xs" version="2.0">
    <xsl:output method="xml" />
    
    <xsl:template match="/">
        <fo:root>
            <fo:layout-master-set>
                <fo:simple-page-master master-name="A4">
                    <fo:region-body margin-top="2.5cm" margin-bottom="2.5cm" />
                    <fo:region-before extent="2cm" />
                    <fo:region-after extent="2cm" />
                </fo:simple-page-master>
            </fo:layout-master-set>
            
            <fo:page-sequence master-reference="A4">
               
                <fo:static-content flow-name="xsl-region-before">
                    <fo:block border-bottom="medium solid #495B6C" margin="1cm" margin-left="2cm" margin-right="2cm" text-align="right" font="10pt Helvetica-Neue-Light">
                        Pauta gerada do projecto: <xsl:value-of select="grades/project"/>
                    </fo:block>
                </fo:static-content>
               
                <fo:static-content flow-name="xsl-region-after">
                    <fo:block border-top="medium solid #495B6C" margin-left="2cm" margin-right="2cm" padding-top="0.2cm" text-align="right" font="10pt Helvetica-Neue-Light">
                        
                    </fo:block>
                </fo:static-content>
                
                <fo:flow flow-name="xsl-region-body" font="12pt Helvetica-Neue-Light" margin="2.5cm">
                    <fo:block  text-align="left" font="16pt Helvetica-Neue-Light" margin-bottom="1cm">Avaliação final de projecto</fo:block>
                    <xsl:apply-templates />
                </fo:flow>
            </fo:page-sequence>
            
        </fo:root>
    </xsl:template>
    
    <xsl:template match="student">
        <fo:block border="thin solid black" width="100%"  text-align="right">
            <fo:inline  text-align="left"><xsl:value-of select="name"/> </fo:inline>
            <fo:inline  text-align="right" padding-left="2cm">Fases: <xsl:apply-templates select="phase"></xsl:apply-templates><fo:inline font-weight="bold" padding-left="2cm" > Avaliação: <xsl:value-of select="project_grade"/></fo:inline>  </fo:inline>
        </fo:block>
    </xsl:template>
    
    <xsl:template match="phase">
        <xsl:value-of select="."></xsl:value-of> | 
    </xsl:template>
    
</xsl:stylesheet>