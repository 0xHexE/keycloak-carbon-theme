<#import "template.ftl" as layout>
<@layout.commonLayout; section>
    <#if section = "title">
      Something went wrong
    <#elseif section = "companyName">
      ${realm.displayNameHtml!?no_esc}
    <#elseif section = "content">
        <div class="form-container">
            <p style="font-size: 1.5rem; line-height: 2rem; padding: 1rem">${message.summary}</p>
            <#if client?? && client.baseUrl?has_content>
              <a class="link-back" id="backToApplication" href="${client.baseUrl}">${msg("backToApplication")}</>
            </#if>
        </div>
    </#if>
</@layout.commonLayout>
