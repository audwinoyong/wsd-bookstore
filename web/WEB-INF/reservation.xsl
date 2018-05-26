<?xml version="1.0" encoding="UTF-8" ?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html"/>
    <xsl:template match="/">
        <html>
            <head>
                <style>
                    table { width: 100%; border-collapse: collapse; }
                    table.reservation td, th { border: solid 1px black; }
                    table.reservation th { text-align: center; }
                    .number { text-align: right; }
                </style>
            </head>
            <body>
                <table class="reservation">
                    <thead>
                        <tr>
                            <th>Book Id</th>
                            <th>Book Title</th>
                            <th>Username</th>
                            <th>User Email</th>
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
        <tr>
            <td>
                <xsl:value-of select="bookId"/>
            </td>
            <td>
                <xsl:value-of select="booktitle"/>
            </td>
            <td>
                <xsl:value-of select="username"/>
            </td>
            <td>
                <xsl:value-of select="email"/>
            </td>
        </tr>
    </xsl:template>

</xsl:stylesheet>
