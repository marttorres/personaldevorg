<aura:application extends="force:slds">
    <ui:message title="Confirmation" severity="confirm" closable="true">
        This is a confirmation message.</ui:message>
    <div>
        <div class="slds-page-header">
            <div class="slds-grid">
                <div class="slds-col slds-has-flexi-truncate">
                    <div class="slds-media slds-no-space slds-grow">
                        <div class="slds-media__figure">
                            <span class="slds-icon_container slds-icon-standard-opportunity" title="Description of icon when needed">
                                
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
                        <span class="slds-text-not-selected"></span>
                        <span class="slds-text-selected"></span>
                        
                    </button>
                    <div class="slds-button-group" role="group">
                        <button class="slds-button slds-button_neutral">Edit</button>
                        <button class="slds-button slds-button_neutral">Delete</button>
                        <button class="slds-button slds-button_neutral">Clone</button>
                        <div class="slds-dropdown-trigger slds-dropdown-trigger_click slds-button_last">
                            <button class="slds-button slds-button_icon slds-button_icon-border-filled" aria-haspopup="true" title="More Actions">
                                
                                <span class="slds-assistive-text">More Actions</span>
                            </button>
                        </div>
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
        <div class="slds-m-left_xx-large">
            <fieldset class="slds-form-element">
                <legend class="slds-form-element__legend slds-form-element__label">Radio Group Label</legend>
                <div class="slds-form-element__control">
                    <span class="slds-radio">
                        <input type="radio" id="radio-3" value="radio-3" name="options" />
                        <label class="slds-radio__label" for="radio-3">
                            <span class="slds-radio_faux"></span>
                            <span class="slds-form-element__label">Radio Label One</span>
                        </label>
                    </span>
                    <span class="slds-radio">
                        <input type="radio" id="radio-4" value="radio-4" name="options" />
                        <label class="slds-radio__label" for="radio-4">
                            <span class="slds-radio_faux"></span>
                            <span class="slds-form-element__label">Radio Label Two</span>
                        </label>
                    </span>
                </div>
            </fieldset>
        </div>
    </div>
    
</aura:application>