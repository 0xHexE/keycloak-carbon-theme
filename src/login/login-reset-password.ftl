<#import "template.ftl" as layout>

<@layout.commonLayout; section>
    <#if section = "title">
      Login in to ${client.name?no_esc}
    <#elseif section = "companyName">
      ${realm.displayNameHtml!?no_esc}
    <#elseif section = "content">
      <form class="form-container" action="${url.loginAction}" method="post">
        <div class="bx--form-item">
          <h1 class="sign-in-card-title">Sign in to continue to ${client.name?no_esc}</h1>
        </div>
        <div class="bx--form-item">
          <label for="usernameInput" class="bx--label"><#if !realm.loginWithEmailAllowed>${msg("username")}<#elseif !realm.registrationEmailAsUsername>${msg("usernameOrEmail")}<#else>${msg("email")}</#if></label>
          <input id="usernameInput"
                 autofocus
                 type="text"
                 class="bx--text-input"
                 autocomplete="off"
                 tabindex="1"
                 value="${(login.username!'')}"
                 name="username">
        </div>
        <button class="bx--btn bx--btn--primary">
          ${msg("doResetPassword")}
        </button>
        <br />
        <a class="" href="${url.loginUrl}">${msg("backToLogin")}</a>
      </form>
    </#if>
</@layout.commonLayout>
