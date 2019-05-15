<#import "template.ftl" as layout>
<@layout.commonLayout; section>
    <#if section = "title">
      Create new account
    <#elseif section = "companyName">
      ${realm.displayNameHtml!?no_esc}
    <#elseif section = "content">
        <form class="form-container" action="${url.registrationAction}" method="post">
          <div class="bx--form-item">
            <h1 class="sign-in-card-title">Create new account</h1>
          </div>
          <#if !realm.registrationEmailAsUsername>
            <div class="bx--form-item">
              <label for="username" class="bx--label">${msg("createUsername")}</label>
              <input type="text" id="username" class="bx--text-input ${messagesPerField.printIfExists('username', 'bx--text-input--invalid')}"
                     name="username"
                     autofocus
                     value="${(register.formData.username!'')}" />
            </div>
          </#if>

          <div class="rows">
            <div class="bx--form-item">
                <label for="firstName" class="bx--label">${msg("firstName")}</label>
                <input type="text"
                      id="firstName"
                      class="bx--text-input ${messagesPerField.printIfExists('firstName', 'bx--text-input--invalid')}"
                      name="firstName"
                      value="${(register.formData.firstName!'')}"/>
            </div>

            <div class="bx--form-item">
              <label for="lastName" class="bx--label">${msg("lastName")}</label>
              <input type="text"
                    id="lastName"
                    class="bx--text-input ${messagesPerField.printIfExists('lastName','bx--text-input--invalid')}"
                    name="lastName"/>
            </div>
          </div>
          
          <div class="bx--form-item">
            <label for="email" class="bx--label">${msg("email")}</label>
            <input type="text"
                   id="email"
                   class="bx--text-input ${messagesPerField.printIfExists('email','bx--text-input--invalid')}"
                   name="email"
                   value="${(register.formData.email!'')}" />
          </div>

            <#if passwordRequired>
              <div class="bx--form-item">
                <label for="password" class="bx--label">${msg("createPassword")}</label>
                <input type="password" id="password" class="bx--text-input ${messagesPerField.printIfExists('password','bx--text-input--invalid')}" name="password" />
              </div>

              <div class="bx--form-item">
                <label for="password-confirm" class="bx--label">${msg("passwordConfirm")}</label>
                <input type="password" id="password-confirm" class="bx--text-input ${messagesPerField.printIfExists('password-confirm','bx--text-input--invalid')}" name="password-confirm" />
              </div>
            </#if>

            <#if recaptchaRequired??>
              <div class="bx--form-item">
                  <div class="${properties.kcInputWrapperClass!}">
                      <div class="g-recaptcha" data-size="compact" data-sitekey="${recaptchaSiteKey}"></div>
                  </div>
              </div>
            </#if>

            <div class="bx--form-item">
              <button class="bx--btn bx--btn--primary" type="submit">${msg("doRegister")}</button>
            </div>

            <a class="link-back" href="${url.loginUrl}">${msg("backToLogin")?no_esc}</a>
        </form>
    </#if>
</@layout.commonLayout>
