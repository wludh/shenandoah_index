<%@ Page Title="" Language="C#" MasterPageFile="~/Application.Master" AutoEventWireup="true" CodeBehind="Search.aspx.cs" Inherits="VS2015Test.Search" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        #ContentPlaceHolder1_SearchRadioButtonList input { margin-left:10px; }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="about" class="jumbotron">
        <h1>Search</h1>
        <p>
            Contents...
            <br />Key Word:
            <asp:TextBox ID="SearchTextBox" runat="server"></asp:TextBox>
            <asp:RadioButtonList ID="SearchRadioButtonList" runat="server" RepeatDirection="Horizontal" CellSpacing="10">
                <asp:ListItem Selected="True">Title</asp:ListItem>
                <asp:ListItem>Author</asp:ListItem>
            </asp:RadioButtonList>
            <asp:Button ID="SearchButton" runat="server" Text="Search" OnClick="SearchButton_Click" />
            <i><asp:Literal ID="SearchLiteral" runat="server"></asp:Literal></i>
        </p>
    </div>
    <asp:Literal ID="ArticlesLiteral" runat="server"></asp:Literal>


    <asp:SqlDataSource ID="ArticlesSqlDataSource" runat="server"
        ConnectionString="<%$ ConnectionStrings:LocalDatabaseConnectionString %>"
        SelectCommand="
            SELECT 'Vol. '
                   + CONVERT(varchar,I.[Volume])
                   + ' No. '
                   + CONVERT(varchar,I.[Issue])
                   + ', '
                   + I.[Season]
                   + ' '
                   + CONVERT(varchar,[Year]) AS [IssueLabel]
                  ,A.[Title]
                  ,A.[StartPage]
                  ,A.[EndPage]
              FROM [Issue] AS I
        INNER JOIN [Article] AS A
                ON A.[IssueID] = I.[ID]
             WHERE (@SearchMode = 'Title' AND A.[Title] LIKE '%' + @SearchText + '%')
                OR (@SearchMode = 'Author'
                      AND
                    EXISTS (SELECT 1
                              FROM [ArticleAuthor] AS AA
                        INNER JOIN [Person] AS P
                                ON P.[ID] = AA.[PersonID]
                               AND (P.[LastName] LIKE '%' + @SearchText + '%' OR P.[MiddleName] LIKE '%' + @SearchText + '%' OR P.[FirstName] LIKE '%' + @SearchText + '%')
                               AND AA.[ArticleID] = A.[ID]
                           )
                   )
                     
          ORDER BY I.[Volume]
                  ,I.[Issue]
                  ,A.[StartPage]
                  ,A.[EndPage]">
        <SelectParameters>
            <asp:ControlParameter Name="SearchMode" ControlID="SearchRadioButtonList" />
            <asp:ControlParameter Name="SearchText" ControlID="SearchTextBox" />
        </SelectParameters>
    </asp:SqlDataSource>

</asp:Content>