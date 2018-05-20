<?xml version="1.0" encoding="UTF-8" ?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">                
    <xsl:output method="html"/>
    <xsl:template match="/">
        <html>
            <head>
                <style>
                    table, th, td { border: solid 1px black; border-collapse: collapse; }
                </style>
            </head>
            <body>
                <table>
                    <thead>
                        <tr>
                            <th>Name</th>
                            <th>Email</th>
                            <th>Password</th>
                            <th>DOB</th>
                        </tr>
                    </thead>
                    <tbody>
                        <xsl:apply-templates/>                       
                    </tbody>
                </table>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="user">    
        <tr>
            <td><xsl:value-of select="name"/></td>
            <td><xsl:value-of select="email"/></td>
            <td><xsl:value-of select="password"/></td>
            <td><xsl:value-of select="dob"/></td>
        </tr>  
    </xsl:template>

</xsl:stylesheet>