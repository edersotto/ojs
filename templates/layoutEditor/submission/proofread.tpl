{**
 * proofread.tpl
 *
 * Copyright (c) 2003-2005 The Public Knowledge Project
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Show the proofreading status of a submission.
 *
 *
 * $Id$
 *}

<!-- START OF PROOFREADING -->
<h3>{translate key="submission.proofreading"}</h3>
{translate key="user.role.proofreader"}:&nbsp;{if $proofAssignment->getProofreaderId()}{$proofAssignment->getProofreaderFullName()}{else}{translate key="common.none"}{/if}<br/>

<table width="100%" class="listing">
	<tr><td colspan="5" class="headseparator"></td></tr>
	<tr class="heading" valign="bottom">
		<td width="40%" colspan="2">{translate key="author.submissions.proofreadingCorrections"}</td>
		<td width="20%">{translate key="submission.request"}</td>
		<td width="20%">{translate key="submission.underway"}</td>
		<td width="20%">{translate key="submission.complete"}</td>
	</tr>
	<tr><td colspan="5" class="headseparator"></td></tr>

<!-- START AUTHOR COMMENTS -->
	<tr valign="top">
		<td width="5%">1.</td>
		<td width="35%">
			{translate key="editor.article.authorProofing"}
			{if $submission->getMostRecentProofreadComment()}
				{assign var="comment" value=$submission->getMostRecentProofreadComment()}
				<a href="javascript:openComments('{$requestPageUrl}/viewProofreadComments/{$submission->getArticleId()}#{$comment->getCommentId()}');"><img src="{$baseUrl}/templates/images/letter.gif" border="0" /></a>{$comment->getDatePosted()|date_format:$dateFormatShort}
			{else}
				<a href="javascript:openComments('{$requestPageUrl}/viewProofreadComments/{$submission->getArticleId()}');"><img src="{$baseUrl}/templates/images/letter.gif" border="0" /></a>
			{/if}
			<br/>
		</td>
		<td>{if $proofAssignment->getDateAuthorNotified()}{$proofAssignment->getDateAuthorNotified()|date_format:$dateFormatShort}{else}&mdash;{/if}</td>
		<td>{if $proofAssignment->getDateAuthorUnderway()}{$proofAssignment->getDateAuthorUnderway()|date_format:$dateFormatShort}{else}&mdash;{/if}</td>
		<td>{if $proofAssignment->getDateAuthorCompleted()}{$proofAssignment->getDateAuthorCompleted()|date_format:$dateFormatShort}{else}&mdash;{/if}</td>
	</tr>
<!-- END AUTHOR COMMENTS -->
	<tr><td colspan="5" class="separator"></td></tr>
<!-- START PROOFREADER COMMENTS -->
	<tr valign="top">
		<td>2.</td>
		<td>
			{translate key="editor.article.proofreaderComments"}
			{if $submission->getMostRecentProofreadComment()}
				{assign var="comment" value=$submission->getMostRecentProofreadComment()}
				<a href="javascript:openComments('{$requestPageUrl}/viewProofreadComments/{$submission->getArticleId()}#{$comment->getCommentId()}');"><img src="{$baseUrl}/templates/images/letter.gif" border="0" /></a>{$comment->getDatePosted()|date_format:$dateFormatShort}
			{else}
				<a href="javascript:openComments('{$requestPageUrl}/viewProofreadComments/{$submission->getArticleId()}');"><img src="{$baseUrl}/templates/images/letter.gif" border="0" /></a>
			{/if}
		</td>
		<td>{if $proofAssignment->getDateProofreaderNotified()}{$proofAssignment->getDateProofreaderNotified()|date_format:$dateFormatShort}{else}&mdash;{/if}</td>
		<td>{if $proofAssignment->getDateProofreaderUnderway()}{$proofAssignment->getDateProofreaderUnderway()|date_format:$dateFormatShort}{else}&mdash;{/if}</td>
		<td>{if $proofAssignment->getDateProofreaderCompleted()}{$proofAssignment->getDateProofreaderCompleted()|date_format:$dateFormatShort}{else}&mdash;{/if}</td>
	</tr>
<!-- END PROOFREADER COMMENTS -->
	<tr><td colspan="5" class="separator"></td></tr>
<!-- START LAYOUT EDITOR FINAL -->
	<tr valign="top">
		<td>3.</td>
		<td>
			{translate key="editor.article.layoutEditorFinal"}
			{if $submission->getMostRecentProofreadComment()}
				{assign var="comment" value=$submission->getMostRecentProofreadComment()}
				<a href="javascript:openComments('{$requestPageUrl}/viewProofreadComments/{$submission->getArticleId()}#{$comment->getCommentId()}');"><img src="{$baseUrl}/templates/images/letter.gif" border="0" /></a>{$comment->getDatePosted()|date_format:$dateFormatShort}
			{else}
				<a href="javascript:openComments('{$requestPageUrl}/viewProofreadComments/{$submission->getArticleId()}');"><img src="{$baseUrl}/templates/images/letter.gif" border="0" /></a>
			{/if}

		</td>
		<td>{if $proofAssignment->getDateLayoutEditorNotified()}{$proofAssignment->getDateLayoutEditorNotified()|date_format:$dateFormatShort}{else}&mdash;{/if}</td>
		<td>{if $proofAssignment->getDateLayoutEditorUnderway()}{$proofAssignment->getDateLayoutEditorUnderway()|date_format:$dateFormatShort}{else}&mdash;{/if}</td>
		<td>
			{if not $proofAssignment->getDateLayoutEditorNotified() or $proofAssignment->getDateLayoutEditorCompleted()}
				{icon name="mail" disabled="disabled" url="$requestPageUrl/layoutEditorProofreadingComplete?articleId=`$submission->getArticleId()`"}&nbsp;
			{else}
				{icon name="mail" url="$requestPageUrl/layoutEditorProofreadingComplete?articleId=`$submission->getArticleId()`"}&nbsp;
			{/if}
			{if $proofAssignment->getDateLayoutEditorCompleted()}{$proofAssignment->getDateLayoutEditorCompleted()|date_format:$dateFormatShort}{/if}
		</td>
	</tr>
	<tr><td colspan="5" class="endseparator"></td></tr>
</table>
<!-- END LAYOUT EDITOR FINAL -->
<!-- END OF PROOFREADING -->


