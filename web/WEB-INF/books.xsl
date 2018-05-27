<?xml version="1.0" encoding="UTF-8" ?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html"/>
    <xsl:template match="/">
        <html>
            <head>
                <style>
                    table { width: 100%; border-collapse: collapse; }
                    table.books td, th { border: solid 1px black; }
                    table.books th { text-align: center; }
                    .number { text-align: right; }
                </style>
            </head>
            <body>
                <table class="books">
                    <thead>
                        <tr>
                            <th>Book Title</th>
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
            <td>
                <a href ="{$href}"> 
                    <xsl:value-of select="booktitle"/>
                </a>
            </td>
            <td>
                <xsl:value-of select="author"/>
            </td>
            <td>
                <xsl:value-of select="category"/>
            </td>
        </tr>
    </xsl:template>

</xsl:stylesheet>
