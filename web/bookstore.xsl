<?xml version="1.0" encoding="UTF-8"?>


<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html"/>


    <xsl:template match="bookstore">
        <html>
            <head>
                <style>
                 table.booklist { border: solid 1px black; border-collapse: collapse; }
                 table.booklist td { border: solid 1px #999; }
                 .author { font-style: italic; margin-bottom: 20px; }
                 .even { background: #fff; }
                 .odd { background: #f2f2f2; }
                </style>                
            </head>
            <body>
                <xsl:apply-templates/>
                <!--<p>Total number of tracks: <xsl:value-of select="count(booklist/books)"/></p>-->
            </body>
        </html>
    </xsl:template>
        <h1>Welcome to bookstore!</h1>
    <xsl:template match="bookslist">
        <table class="booklist">
            <thead>
                <tr>
                    <th> </th>
                    <th>Book title</th>
                    <th>Book author</th>
                    <th>Book category</th>
                </tr>
            </thead>
            <tbody>
<!--                <xsl:apply-templates/>-->
            </tbody>
        </table>
    </xsl:template>
<!--    <xsl:template match="books">
        <xsl:variable name="class">
            <xsl:choose>
                <xsl:when test="id mod 2 = 0">even</xsl:when>
                <xsl:otherwise>odd</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <tr class="{$class}">
            
            <td>#<xsl:value-of select="id"/>
            </td>
            <td>
                <xsl:value-of select="title"/> 
            </td>
            <td>
                <xsl:value-of select="author"/> 
            </td>            
            <td>
                <xsl:value-of select="category"/> 
            </td>            
            <td>
                <xsl:value-of select="count(booklist/book)"/>
            </td>
        </tr>
    </xsl:template>-->
</xsl:stylesheet>
