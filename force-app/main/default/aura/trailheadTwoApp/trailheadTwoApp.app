<aura:application extends="force:slds">
    <aura:attribute name="options" type="List" default="[
                                                        {'label': 'Sales', 'value': 'option1'},
                                                        {'label': 'Force', 'value': 'option2'}
                                                        ]"/>
    <aura:attribute name="value" type="String" default="option1"/>
    
    <div class="c-container">
        <lightning:layout multipleRows="true">
            <lightning:layoutItem padding="around-small" size="12">
                <div class="page-section page-header">
                    <div class="slds-page-header">
                        <div class="slds-grid">
                            <div class="slds-col slds-has-flexi-truncate">
                                <div class="slds-media slds-no-space slds-grow">
                                    <div class="slds-media__figure">
                                        <span class="slds-icon_container slds-icon-standard-opportunity" title="Description of icon when needed">
                                            <lightning:icon iconName="standard:event" alternativeText="Event" />
                                        </span>
                                    </div>
                                    <div class="slds-media__body">
                                        <nav>
                                            <ol class="slds-breadcrumb slds-line-height_reset">
                                                <li class="slds-breadcrumb__item">
                                                    <span>Opportunities</span>
                                                </li>
                                            </ol>
                                        </nav>
                                        <h1 class="slds-page-header__title slds-m-right_small slds-align-middle slds-truncate" title="Acme - 1,200 Widgets">Acme - 1,200 Widgets</h1>
                                    </div>
                                </div>
                            </div>
                            <div class="slds-col slds-no-flex slds-grid slds-align-top">
                                <button class="slds-button slds-button_neutral slds-button_stateful slds-not-selected" aria-live="assertive">
                                    <span class="slds-text-not-selected">                                        
                                        <lightning:icon iconName="utility:connected_apps" alternativeText="Connected" />
                                    </span>
                                    <span class="slds-text-selected">                                        
                                        <lightning:icon iconName="utility:connected_apps" alternativeText="Connected" />
                                    </span>
                                    <span class="slds-text-selected-focus">
                                        <lightning:icon iconName="utility:connected_apps" alternativeText="Connected" />
                                    </span>
                                </button>
                                <div class="slds-button-group" role="group">
                                    <button class="slds-button slds-button_neutral">Edit</button>
                                    <button class="slds-button slds-button_neutral">Delete</button>
                                    <button class="slds-button slds-button_neutral">Clone</button>
                                </div>
                            </div>
                        </div>
                        <ul class="slds-grid slds-page-header__detail-row">
                            <li class="slds-page-header__detail-block">
                                <p class="slds-text-title slds-truncate slds-m-bottom_xx-small" title="Field 1">Field 1</p>
                                <p class="slds-text-body_regular slds-truncate" title="Description that demonstrates truncation with a long text field">Description that demonstrates truncation with a long text field.</p>
                            </li>
                            <li class="slds-page-header__detail-block">
                                <p class="slds-text-title slds-truncate slds-m-bottom_xx-small" title="Field2 (3)">Field 2 (3)
                                    <button class="slds-button slds-button_icon slds-button_icon" aria-haspopup="true" title="More Actions">
                                        <lightning:icon iconName="standard:event" alternativeText="Event" />
                                        <span class="slds-assistive-text">More Actions</span>
                                    </button>
                                </p>
                                <p class="slds-text-body_regular">Multiple Values</p>
                            </li>
                            <li class="slds-page-header__detail-block">
                                <p class="slds-text-title slds-truncate slds-m-bottom_xx-small" title="Field 3">Field 3</p><a href="javascript:void(0);">Hyperlink</a></li>
                            <li class="slds-page-header__detail-block">
                                <p class="slds-text-title slds-truncate slds-m-bottom_xx-small" title="Field 4">Field 4</p>
                                <p title="Description (2-line truncation—must use JS to truncate).">Description (2-line truncati...</p>
                            </li>
                        </ul>
                    </div>
                </div>
            </lightning:layoutItem>
            <lightning:layoutItem padding="around-small" size="12">
                <lightning:layout >
                    <lightning:layoutItem padding="around-small" size="3">
                        <div class="page-section page-right">
                            <lightning:card variant="Narrow" title="Narrow Card Header" iconName="standard:account" footer="Card Footer">
                                <aura:set attribute="actions">
                                    <lightning:buttonIcon iconName="utility:down" variant="border-filled" alternativeText="Show More"/>
                                </aura:set>
                                <p class="slds-p-horizontal_small">
                                    Card Body (custom component)
                                </p>
                            </lightning:card>
                            <lightning:card variant="Narrow" title="Narrow Card Header" iconName="standard:account" footer="Card Footer">
                                <aura:set attribute="actions">
                                    <lightning:buttonIcon iconName="utility:down" variant="border-filled" alternativeText="Show More"/>
                                </aura:set>
                                <p class="slds-p-horizontal_small">
                                    Card Body (custom component)
                                </p>
                            </lightning:card>
                            <lightning:card variant="Narrow" title="Narrow Card Header" iconName="standard:account" footer="Card Footer">
                                <aura:set attribute="actions">
                                    <lightning:buttonIcon iconName="utility:down" variant="border-filled" alternativeText="Show More"/>
                                </aura:set>
                                <p class="slds-p-horizontal_small">
                                    Card Body (custom component)
                                </p>
                            </lightning:card>
                            <lightning:card variant="Narrow" title="Narrow Card Header" iconName="standard:account" footer="Card Footer">
                                <aura:set attribute="actions">
                                    <lightning:buttonIcon iconName="utility:down" variant="border-filled" alternativeText="Show More"/>
                                </aura:set>
                                <p class="slds-p-horizontal_small">
                                    Card Body (custom component)
                                </p>
                            </lightning:card>
                        </div>
                    </lightning:layoutItem>
                    <lightning:layoutItem padding="around-small" size="9">
                        <div class="page-section page-main">
                            <div class="slds-form slds-form_stacked">
                                <div class="slds-form-element">
                                    <label class="slds-form-element__label" for="input-id-01">Text Input</label>
                                    <div class="slds-form-element__control">
                                        <lightning:input name="input1" label="Enter some text" />
                                    </div>
                                </div>
                                <div class="slds-form-element">
                                    <label class="slds-form-element__label" for="input-id-02">Textarea Label</label>
                                    <div class="slds-form-element__control">
                                        <lightning:select name="select1" label="How many tickets?" required="true">
                                            <option value="">choose one...</option>
                                            <option value="1">one</option>
                                            <option value="2">two</option>
                                            <option value="3">three</option>
                                        </lightning:select>
                                    </div>
                                </div>                                
                                <div class="slds-form-element">
                                    <label class="slds-form-element__label" for="input-id-02">Textarea Label</label>
                                    <div class="slds-form-element__control">
                                        <lightning:radioGroup name="radioGroup"
                                                              label="Radio Group"
                                                              options="{! v.options }"
                                                              value="{! v.value }"
                                                              type="radio"/>
                                    </div>
                                </div>                                
                                <div class="slds-form-element">
                                    <label class="slds-form-element__label" for="input-id-02">Textarea Label</label>
                                    <div class="slds-form-element__control">
                                        <lightning:inputRichText value="" placeholder="Type something interesting"/>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </lightning:layoutItem>
                </lightning:layout>
            </lightning:layoutItem>
            <lightning:layoutItem flexibility="auto" padding="around-small" size="12">
                <div class="page-footer page-section">
                    <p>ARDC Querétaro</p>
                </div>
            </lightning:layoutItem>
        </lightning:layout>
    </div>
    
</aura:application>