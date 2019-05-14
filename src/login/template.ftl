<#macro registrationLayout bodyClass="" displayInfo=false displayMessage=true>
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
                        <#assign LANG_CODE = supportedLocale.url?keep_after("?kc_locale=")[0..1]>
                    </#if>
                    <#if supportedLocale.url?contains("&kc_locale=")>
                        <#assign LANG_CODE = supportedLocale.url?keep_after("&kc_locale=")[0..1]>
                    </#if>
                </#if>
            </#items>
        </#list>
    </#if>

    <!--[if lt IE 9]>
    <html class="lte-ie8 ${properties.kcHtmlClass!}" lang="${LANG_CODE}"><![endif]-->
    <!--[if gt IE 8]><!-->
    <html class="${properties.kcHtmlClass!}" lang="${LANG_CODE}"><!--<![endif]-->

    <head>
        <meta charset="utf-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="robots" content="noindex, nofollow">

        <#if properties.meta?has_content>
            <#list properties.meta?split(' ') as meta>
                <meta name="${meta?split('==')[0]}" content="${meta?split('==')[1]}"/>
            </#list>
        </#if>

        <title><#nested "title"> - ${realm.displayName!'GOV.UK'}</title>

        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link href="https://unpkg.com/material-components-web@latest/dist/material-components-web.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <script src="https://unpkg.com/material-components-web@latest/dist/material-components-web.min.js"></script>

        <#if properties.styles?has_content>
            <#list properties.styles?split(' ') as style>
                <link href="${url.resourcesPath}/${style}" rel="stylesheet"/>
            </#list>
        </#if>

        <#if properties.scripts?has_content>
            <#list properties.scripts?split(' ') as script>
                <script src="${url.resourcesPath}/${script}" type="text/javascript"></script>
            </#list>
        </#if>

        <#if scripts??>
            <#list scripts as script>
                <script src="${script}" type="text/javascript"></script>
            </#list>
        </#if>

        <link rel="stylesheet" href="${url.resourcesPath}/css/common.css">

    </head>

    <body class="${properties.kcBodyClass!}">

    <main id="content" role="main">
        <div><#nested "back"></div>

        <div class="grid-row">
            <div class="column-two-thirds">
                <div id="kc-container" class="${properties.kcContainerClass!}">
                    <div id="kc-container-wrapper" class="${properties.kcContainerWrapperClass!}">
                        <#if realm.internationalizationEnabled>
                            <div id="kc-locale" class="${properties.kcLocaleClass!}">
                                <div id="kc-locale-wrapper" class="${properties.kcLocaleWrapperClass!}">
                                    <div class="kc-dropdown" id="kc-locale-dropdown">
                                        <a href="#" id="kc-current-locale-link">${locale.current}</a>
                                        <ul>
                                            <#list locale.supported as l>
                                                <li class="kc-dropdown-item"><a href="${l.url}">${l.label}</a></li>
                                            </#list>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </#if>

                        <div id="kc-content" class="${properties.kcContentClass!}">
                            <div id="kc-content-wrapper" class="${properties.kcContentWrapperClass!}">

                                <#if displayMessage && message?has_content>
                                    <#if message.type = 'error'>
                                        <div class="mdc-snackbar mdc-snackbar--open">
                                            <div class="mdc-snackbar__surface">
                                                <div class="mdc-snackbar__label"
                                                     role="status"
                                                     aria-live="polite">
                                                    ${message.summary}
                                                </div>
                                            </div>
                                        </div>
                                    <#else>
                                        <div class="${properties.kcFeedbackAreaClass!}">
                                            <div class="alert alert-${message.type} mdc-snackbar mdc-snackbar--open">
                                                <div class="mdc-snackbar__surface">
                                                    <div class=" mdc-snackbar__label kc-feedback-text">${message.summary}</div>
                                                </div>
                                            </div>
                                        </div>
                                    </#if>
                                </#if>

                                <div id="kc-form" class="${properties.kcFormAreaClass!}">
                                    <div id="kc-form-wrapper" class="${properties.kcFormAreaWrapperClass!}">
                                        <#nested "form">
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="column-one-third">
                <#if displayInfo>
                    <div id="kc-info" class="${properties.kcInfoAreaClass!}">
                        <div id="kc-info-wrapper" class="${properties.kcInfoAreaWrapperClass!}">
                            <#nested "info">
                        </div>
                    </div>
                </#if>
            </div>
        </div>
    </main>
    <div id="global-app-error" class="app-error hidden"></div>
    <script>
        window.mdc.autoInit();
    </script>
    </body>
    </html>
</#macro>
