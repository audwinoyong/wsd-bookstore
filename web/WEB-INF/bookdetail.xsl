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
                            <th>Condition</th>
                            <th>ISBN</th>
                            <th>Year of Publication</th>
                            <th>Publisher</th>
                            <th>Username</th>
                            <th>Abstract</th>
                            <th>Reservation</th>
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
        <xsl:variable name="status" select="availability"/>
        <xsl:variable name="href1">reservationForm.jsp?bookId=<xsl:value-of select="bookId"/>&amp;booktitle=<xsl:value-of select="booktitle"/></xsl:variable>
        <xsl:variable name="href2">reservation.jsp?bookId=<xsl:value-of select="bookId"/></xsl:variable>

        <tr>
            <td>
                <xsl:value-of select="booktitle"/>
            </td>
            <td>
                <xsl:value-of select="author"/>
            </td>
            <td>
                <xsl:value-of select="category"/>
            </td>
            <td>
                <xsl:value-of select="condition"/>
            </td>
            <td>
                <xsl:value-of select="isbn"/>
            </td>
            <td class="number">
                <xsl:value-of select="publishYear"/>
            </td>
            <td>
                <xsl:value-of select="publisher"/>
            </td>
            <td>
                <xsl:value-of select="username"/>
            </td>
            <td>
                <xsl:value-of select="abstract"/>
            </td>
            <xsl:choose>
                <xsl:when test="$status = 'Available'">
                    <td>
                        <a href="{$href1}">
                            <xsl:value-of select="availability"/>
                        </a>
                    </td>
                </xsl:when>
                <xsl:otherwise>
                    <td>
                        <a href="{$href2}">
                            <xsl:value-of select="availability"/>
                        </a>
                    </td>
                </xsl:otherwise>
            </xsl:choose>
        </tr>
    </xsl:template>
</xsl:stylesheet>
