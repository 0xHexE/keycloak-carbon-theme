<#macro commonLayout bodyClass="" displayInfo=false displayMessage=true>
    <!DOCTYPE html>

    <#assign LANG_CODE = "en">
    <#if .locale??>
        <#assign LANG_CODE = .locale>
    </#if>

    <#if locale??>
        <#list locale.supported>
            <#items as supportedLocale>
                <#if supportedLocale.label == locale.current>
                    <#if supportedLocale.url?contains("?kc_locale=")>
                    </#if>
                        <#assign LANG_CODE = supportedLocale.url?keep_after("?kc_locale=")[0..1]>
                    <#if supportedLocale.url?contains("&kc_locale=")>
                        <#assign LANG_CODE = supportedLocale.url?keep_after("&kc_locale=")[0..1]>
                    </#if>
                </#if>
            </#items>
        </#list>
    </#if>

    <!--[if lt IE 9]>
    <html class="lte-ie8 ${properties.htmlClass!}" lang="${LANG_CODE}"><![endif]-->
    <!--[if gt IE 8]><!-->
    <html class="${properties.HtmlClass!}" lang="${LANG_CODE}"><!--<![endif]-->

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="robots" content="noindex, nofollow">

        <#if properties.meta?has_content>
            <#list properties.meta?split(' ') as meta>
                <meta name="${meta?split('==')[0]}" content="${meta?split('==')[1]}"/>
            </#list>
        </#if>

        <title><#nested "title"></title>

        <meta name="viewport" content="width=device-width, initial-scale=1">

        <#if properties.styles?has_content>
            <#list properties.styles?split(' ') as style>
                <link href="${url.resourcesPath}/${style}" rel="stylesheet"/>
            </#list>
        </#if>

        <#if properties.scripts?has_content>
            <#list properties.scripts?split(' ') as script>
                <script src="${url.resourcesPath}/js/${script}" type="text/javascript"></script>
            </#list>
        </#if>

        <#if scripts??>
            <#list scripts as script>
                <script src="${script}" type="text/javascript"></script>
            </#list>
        </#if>

    </head>

    <body class="${properties.bodyClass!}">
      <div class="app-toolbar">
        <h1 style="font-size: 1.2rem; font-weight: 700"><#nested "companyName"></h1>
      </div>

      <#if displayMessage && message?has_content>
        <#if message.type = 'error'>
          <div data-notification class="bx--toast-notification bx--toast-notification--error fixed-notification" role="alert">
            <svg focusable="false" preserveAspectRatio="xMidYMid meet" style="will-change: transform;" xmlns="http://www.w3.org/2000/svg" class="bx--toast-notification__icon" width="20" height="20" viewBox="0 0 20 20" aria-hidden="true"><path d="M10 1c-5 0-9 4-9 9s4 9 9 9 9-4 9-9-4-9-9-9zm3.5 13.5l-8-8 1-1 8 8-1 1z"></path><path d="M13.5 14.5l-8-8 1-1 8 8-1 1z" data-icon-path="inner-path" opacity="0"></path></svg>
            <div class="bx--toast-notification__details">
              <h3 class="bx--toast-notification__title">There is a problem with this form</h3>
              <p class="bx--toast-notification__subtitle">${message.summary}</p>
            </div>
          </div>
        <#else>
          <div class="${properties.kcFeedbackAreaClass!}">
            <div class="alert alert-${message.type}"><p>
              <#if message.type = 'success'><span class="${properties.kcFeedbackSuccessIcon!}"></span></#if>
              <#if message.type = 'warning'><span class="${properties.kcFeedbackWarningIcon!}"></span></#if>
              <#if message.type = 'info'><span class="${properties.kcFeedbackInfoIcon!}"></span></#if>
              <span class="kc-feedback-text">${message.summary}</span></p>
            </div>
          </div>
        </#if>
      </#if>

      <div class="container">
        <#nested "content">
      </div>
    </body>
    </html>
</#macro>
