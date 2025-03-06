<?php
/**
 * Title: Latest Posts
 * Slug: glamourhub/latest-posts
 * Categories: glamourhub
 *
 * @package glamourhub
 */

?>
<!-- wp:group {"layout":{"type":"default"},"metadata":{"name":"Latest Post"}} -->
<div class="wp-block-group"><!-- wp:group {"style":{"spacing":{"blockGap":"8px","margin":{"bottom":"var:preset|spacing|small"}}},"layout":{"type":"constrained"}} -->
<div class="wp-block-group" style="margin-bottom:var(--wp--preset--spacing--small)"><!-- wp:heading {"textAlign":"left"} -->
<h2 class="wp-block-heading has-text-align-left"><?php esc_html_e( 'Our Blog', 'glamourhub' ); ?></h2>
<!-- /wp:heading -->

<!-- wp:paragraph {"align":"left"} -->
<p class="has-text-align-left"><?php esc_html_e( 'Latest News &amp; Articles (Our Mega deal and offers)', 'glamourhub' ); ?></p>
<!-- /wp:paragraph --></div>
<!-- /wp:group -->

<!-- wp:group {"style":{"spacing":{"padding":{"bottom":"var:preset|spacing|large"}}},"layout":{"type":"constrained"}} -->
<div class="wp-block-group" style="padding-bottom:var(--wp--preset--spacing--large)"><!-- wp:query {"queryId":4,"query":{"perPage":"2","pages":0,"offset":0,"postType":"post","order":"desc","orderBy":"date","author":"","search":"","exclude":[],"sticky":"","inherit":false}} -->
<div class="wp-block-query"><!-- wp:post-template {"layout":{"type":"grid","columnCount":2},"fontSize":"16"} -->
<!-- wp:columns {"style":{"spacing":{"blockGap":{"top":"24px","left":"24px"},"padding":{"top":"0","bottom":"0","left":"0","right":"0"}}},"backgroundColor":"bd-color"} -->
<div class="wp-block-columns has-bd-color-background-color has-background" style="padding-top:0;padding-right:0;padding-bottom:0;padding-left:0"><!-- wp:column {"verticalAlignment":"top","layout":{"type":"default"}} -->
<div class="wp-block-column is-vertically-aligned-top"><!-- wp:cover {"useFeaturedImage":true,"focalPoint":{"x":0.61,"y":0.53},"minHeight":280,"minHeightUnit":"px","customGradient":"linear-gradient(180deg,rgba(0,0,0,0) 26%,rgba(0,0,0,0.7) 100%)","contentPosition":"bottom left","layout":{"type":"constrained"}} -->
<div class="wp-block-cover has-custom-content-position is-position-bottom-left" style="min-height:280px"><span aria-hidden="true" class="wp-block-cover__background has-background-dim-100 has-background-dim has-background-gradient" style="background:linear-gradient(180deg,rgba(0,0,0,0) 26%,rgba(0,0,0,0.7) 100%)"></span><div class="wp-block-cover__inner-container"><!-- wp:paragraph {"align":"center","placeholder":"Write title…","fontSize":"large"} -->
<p class="has-text-align-center has-large-font-size"></p>
<!-- /wp:paragraph --></div></div>
<!-- /wp:cover --></div>
<!-- /wp:column -->

<!-- wp:column {"verticalAlignment":"top","style":{"spacing":{"padding":{"top":"24px","bottom":"24px","left":"0","right":"24px"}}}} -->
<div class="wp-block-column is-vertically-aligned-top" style="padding-top:24px;padding-right:24px;padding-bottom:24px;padding-left:0"><!-- wp:post-title {"level":3,"isLink":true,"style":{"elements":{"link":{"color":{"text":"var:preset|color|heading"}}},"typography":{"textTransform":"capitalize"}},"fontSize":"24"} /-->

<!-- wp:post-date {"style":{"spacing":{"margin":{"top":"12px","bottom":"12px"}},"elements":{"link":{"color":{"text":"#848484"}}},"color":{"text":"#848484"}},"fontSize":"14"} /-->

<!-- wp:post-excerpt {"moreText":"Read more","showMoreOnNewLine":false,"excerptLength":15,"style":{"spacing":{"margin":{"top":"0","bottom":"0"}}},"fontSize":"18"} /--></div>
<!-- /wp:column --></div>
<!-- /wp:columns -->
<!-- /wp:post-template -->

<!-- wp:query-no-results -->
<!-- wp:paragraph {"align":"center","placeholder":"Add text or blocks that will display when a query returns no results."} -->
<p class="has-text-align-center"><?php esc_html_e( 'No blog post found!', 'glamourhub' ); ?></p>
<!-- /wp:paragraph -->
<!-- /wp:query-no-results --></div>
<!-- /wp:query --></div>
<!-- /wp:group --></div>
<!-- /wp:group -->
