<#import "parts/common.ftlh" as c>
<#import "parts/login.ftlh" as l>

<@c.page>
    <div>
        <@l.logout></@l.logout>
        <span><a href="/user">User list</a></span>
    </div>
    <div>
        <form method="post" enctype="multipart/form-data">
            <input type="text" name="text" placeholder="Введите сообщение">
            <input type="text" name="tag" placeholder="Тэги">
            <input type="file" name="file">
            <input type="hidden" name="_csrf" value="${_csrf.token}">
            <button type="submit">Добавить</button>
        </form>
    </div>
    <div>Список сообщений:</div>
    <form method="get" action="/main">
        <input type="text" name="filter" value="${filter?ifExists}">
        <button type="submit">Найти</button>
    </form>
    <#list messages as message>
    <div>
        <b># ${message.id}</b>
        <span>Text: ${message.text}</span>
        <i>Tag: ${message.tag}</i>
        <strong>Author: ${message.authorName}</strong>
        <div>
            <#if message.filename??>
                <img src="/img/${message.filename}" alt="${message.filename}">
            </#if>
        </div>
    </div>
    <#else>
        No messages
    </#list>
</@c.page>