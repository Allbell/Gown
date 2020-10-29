<#import "parts/common.ftlh" as c>
<#import "parts/login.ftlh" as l>

<@c.page>
    <div>
        Add new user:
        ${message?ifExists}
    </div>
    <@l.login "/registration" ></@l.login>
</@c.page>