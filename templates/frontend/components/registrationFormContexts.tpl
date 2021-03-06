{**
 * templates/frontend/components/registrationFormContexts.tpl
 *
 * Copyright (c) 2014-2018 Simon Fraser University
 * Copyright (c) 2003-2018 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief Display role selection for all of the journals/presses on this site
 *
 * @uses $contexts array List of journals/presses on this site
 * @uses $readerUserGroups array Associative array of user groups with reader
 *  permissions in each context.
 * @uses $authorUserGroups array Associative array of user groups with author
 *  permissions in each context.
 * @uses $reviewerUserGroups array Associative array of user groups with reviewer
 *  permissions in each context.
 * @uses $userGroupIds array List group IDs this user is assigned
 *}

{* Only display the context role selection when registration is taking place
   outside of the context of any one journal/press. *}
{if !$currentContext}

	{* Allow users to register for any journal/press on this site *}
	<fieldset class="contexts">
		<legend>
			{translate key="user.register.contextsPrompt"}
		</legend>
		<div class="list-group">
			{foreach from=$contexts item=context}
				{assign var=contextId value=$context->getId()}
				<div class="list-group-item">
					<div class="list-group-item-heading">
						{$context->getLocalizedName()}
					</div>
					<p>
						{translate key="user.register.otherContextRoles"}
					</p>
					<div class="form-group">
						{foreach from=$readerUserGroups[$contextId] item=userGroup}
							{if $userGroup->getPermitSelfRegistration()}
								<div class="form-check">
									<input type="checkbox" class="form-check-input" name="readerGroup[{$userGroup->getId()}]"{if in_array($userGroup->getId(), $userGroupIds)} checked="checked"{/if}>
									<label class="form-check-label">
										{$userGroup->getLocalizedName()}
									</label>
								</div>
							{/if}
						{/foreach}
						{foreach from=$authorUserGroups[$contextId] item=userGroup}
							{if $userGroup->getPermitSelfRegistration()}
								<div class="form-check">
									<input type="checkbox" class="form-check-input" name="authorGroup[{$userGroup->getId()}]"{if in_array($userGroup->getId(), $userGroupIds)} checked="checked"{/if}>
									<label class="form-check-label">
										{$userGroup->getLocalizedName()}
									</label>
								</div>
							{/if}
						{/foreach}
						{foreach from=$reviewerUserGroups[$contextId] item=userGroup}
							{if $userGroup->getPermitSelfRegistration()}
								<div class="form-check">
									<input type="checkbox" class="form-check-input" name="reviewerGroup[{$userGroup->getId()}]"{if in_array($userGroup->getId(), $userGroupIds)} checked="checked"{/if}>
									<label class="form-check-label">
										{$userGroup->getLocalizedName()}
									</label>
								</div>
							{/if}
						{/foreach}
					</div>
				</div>
			{/foreach}
		</div>
	</fieldset>
{/if}
