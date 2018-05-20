<?xml version="1.0" encoding="UTF-8" ?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html"/>
    <xsl:template match="/">
        <html>
            <body>
                <table>
                    <thead>
                        <tr>
                            <th>Book ID</th>
                            <th>Book title</th>
                            <th>Delete</th>
                        </tr>
                    </thead>
                    <tbody>
                        <xsl:apply-templates/>
                    </tbody>
                </table>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="reservation">
        <xsl:variable name="href">deleteReservation.jsp?bookId=<xsl:value-of select="bookId"/></xsl:variable>

        <tr>
            <td><xsl:value-of select="bookId"/></td>
            <td><xsl:value-of select="booktitle"/></td>
            <td><a href="{$href}">Delete</a></td>
        </tr>
    </xsl:template>
</xsl:stylesheet>
