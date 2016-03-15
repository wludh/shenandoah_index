<%@ Page Title="" Language="C#" MasterPageFile="~/Application.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="VS2015Test.Index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="about" class="jumbotron">
        <h1>Index</h1>
        <p>
            Contents...
            <br />Browse by index:
            <asp:DropDownList ID="IssueDropDownList" runat="server"
                DataSourceID="IssuesSqlDataSource"
                DataTextField="Label"
                DataValueField="ID"
                AutoPostBack="true"
                OnSelectedIndexChanged="IssueDropDownList_SelectedIndexChanged">
            </asp:DropDownList>
        </p>
    </div>

    <asp:Panel ID="IssuePanel" runat="server" Visible="false">
        <h2><asp:Label ID="IssueNumberLabel" runat="server" Text="Label"></asp:Label></h2>
        <asp:Literal ID="ArticlesLiteral" runat="server"></asp:Literal>
    </asp:Panel>


    <asp:SqlDataSource ID="IssuesSqlDataSource" runat="server"
        ConnectionString="<%$ ConnectionStrings:LocalDatabaseConnectionString %>"
        SelectCommand="
            SELECT NULL AS [ID]
                  ,NULL AS [Volume]
                  ,NULL AS [Issue]
                  ,NULL AS [Year]
                  ,NULL AS [Season]
                  ,'- Select Issue -' AS [Label]
             UNION
            SELECT [ID]
                  ,[Volume]
                  ,[Issue]
                  ,[Year]
                  ,[Season]
                  ,'Vol. '
                   + CONVERT(varchar,[Volume])
                   + ' No. '
                   + CONVERT(varchar,[Issue])
                   + ', '
                   + [Season]
                   + ' '
                   + CONVERT(varchar,[Year]) AS [Label]
              FROM [Issue]
          ORDER BY [Volume]
                  ,[Issue]">
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="ArticlesSqlDataSource" runat="server"
        ConnectionString="<%$ ConnectionStrings:LocalDatabaseConnectionString %>"
        SelectCommand="
            SELECT [ID]
                  ,[IssueID]
                  ,[Title]
                  ,[StartPage]
                  ,[EndPage]
              FROM [Article]
             WHERE [IssueID] = @IssueID
          ORDER BY [StartPage]
                  ,[EndPage]">
        <SelectParameters>
            <asp:ControlParameter Name="IssueID" ControlID="IssueDropDownList" />
        </SelectParameters>
    </asp:SqlDataSource>

</asp:Content>