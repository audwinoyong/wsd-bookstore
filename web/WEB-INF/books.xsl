<?xml version="1.0" encoding="UTF-8" ?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html"/>
    <xsl:template match="/">
        <html>

            <body>
                <table>
                    <thead>
                        <tr>
                            <th>Book title</th>
                            <th>Author</th>
                            <th>Category</th>
                        </tr>
                    </thead>
                    <tbody>
                        <xsl:apply-templates/>
                    </tbody>
                </table>
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="book">
        <xsl:variable name="href">bookDetails.jsp?booktitle=<xsl:value-of select="booktitle"/></xsl:variable>
        <tr>
            <td><a href ="{$href}"> <xsl:value-of select="booktitle"/></a></td>

            <td><xsl:value-of select="author"/></td>
            <td><xsl:value-of select="category"/></td>
        </tr>
    </xsl:template>

</xsl:stylesheet>
