<?xml version="1.0" encoding="UTF-8"?>


<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" xmlns:t="http://www.test.com" >
    <xsl:output method="html"/>
    <xsl:template match="/">
        <html>
            <head>
                
            </head>
            <body>
                <xsl:apply-templates/>
            </body>
        </html>
    </xsl:template>
   
    <xsl:template match="bookstore">
        <h1><xsl:apply-templates/></h1>
    </xsl:template>
    
    <xsl:template match="name">
        <div> Name: <xsl:apply-templates/></div>
    </xsl:template>
    
    <xsl:template match="bookstore/bookslist">
        <table>
            <thead>
                <tr>
                    <th>No.</th>
                    <th>Book title</th>
                    <th>Author</th>
                    <th>Category</th>
                </tr>
            </thead>
            <tbody>
                <xsl:apply-templates/>
            </tbody>
        </table>
    </xsl:template>
    <xsl:template match="books">
        <tr> <xsl:apply-templates/></tr>
    </xsl:template>
    <xsl:template match="books/booksId|title|author|category">
        <td><xsl:apply-templates/></td>
    </xsl:template>
    <xsl:template match="booklist" />



    
    
<!--
    <xsl:template match="bookstore/bookslist">
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
                <p>
                    <xsl:apply-templates/>
                </p>
                <p>Total number of tracks: <xsl:value-of select="count(bookslist/books)"/></p>
            </body>
        </html>
        <h1>Welcome to bookstore!</h1>
    </xsl:template>
    <xsl:template match="bookslist">
        <table class="booklist">
            <thead>
                <tr>
                    <th> </th>
                    <th>Book title</th>
                    <th>Book author</th>
                    <th>Book category</th>
                    <th>Number of books</th>
                </tr>
            </thead>
            <tbody>
                <xsl:apply-templates/>
            </tbody>
        </table>
    </xsl:template>
    <xsl:template match="books"> 
        <tr>
            
            <td>#<xsl:value-of select="booksId"/>
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
             
    </xsl:template>
    <xsl:template select = "book" />
    <xsl:template match="books"> 
    
    <xsl:template match="bookslist/books">
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
