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
                 placeholder="Enter your <#if !realm.loginWithEmailAllowed>${msg("username")}<#elseif !realm.registrationEmailAsUsername>${msg("usernameOrEmail")?lower_case}<#else>${msg("email")?lower_case}</#if>"
                 value="${(login.username!'')}"
                 <#if usernameEditDisabled??>
                   disabled="true"
                 </#if>
                 name="username">
        </div>

        <div class="bx--form-item">
          <label for="passwordInput" class="bx--label">${msg("password")}</label>
          <input id="passwordInput"
                 type="text"
                 class="bx--text-input"
                 tabindex="2"
                 placeholder="Enter your password"
                 name="password">
        </div>

        <#if realm.resetPasswordAllowed>
          <div class="bx--form-item">
            <a class="forgot-password-link" href="${url.loginResetCredentialsUrl}" tabindex="5">${msg("doForgotPassword")}</a>
          </div>
        </#if>

        <#if realm.rememberMe && !usernameEditDisabled??>
          <div class="bx--form-item bx--checkbox-wrapper remember-me-checkbox">
            <input id="rememberMe" class="bx--checkbox" type="checkbox" name="rememberMe" tabindex="4" <#if login.rememberMe??>checked</#if>>
            <label for="rememberMe" class="bx--checkbox-label">${msg("rememberMe")}</label>
          </div>
        </#if>

        <div class="bx--form-item">
          <button class="bx--btn bx--btn--primary" tabindex="3" type="submit">${msg('loginTitle', client.name)}</button>
        </div>

        <div class="sign-up-divider"></div>

        <span>${msg('dontHaveAccount')}</span>&nbsp;<a href="${url.registrationUrl}">${msg("Create account")}</a>

        <#if realm.password && social.providers??>
          <br />
          <div class="sign-up-divider"></div>
          <span>${msg('socialProviders')}</span>
          <br />
          <#list social.providers as p>
            <a href="${p.loginUrl}" id="zocial-${p.alias}" class="bx--btn bx--btn--tertiary social-login ${p.providerId}">${p.displayName}</a>
          </#list>
        </#if>

      </form>
    </#if>
</@layout.commonLayout>
