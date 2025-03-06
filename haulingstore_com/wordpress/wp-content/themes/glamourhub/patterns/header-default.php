<?php
/**
 * Title: Header Default
 * Slug: glamourhub/header-default
 * Categories: glamourhub
 *
 * @package glamourhub
 */

?>
<!-- wp:group {"layout":{"type":"default"},"metadata":{"name":"Header Wrapper"}} -->
<div class="wp-block-group"><!-- wp:group {"style":{"spacing":{"padding":{"top":"8px","bottom":"8px"}}},"layout":{"type":"constrained"}} -->
<div class="wp-block-group" style="padding-top:8px;padding-bottom:8px"><!-- wp:columns {"verticalAlignment":"center","isStackedOnMobile":false} -->
<div class="wp-block-columns are-vertically-aligned-center is-not-stacked-on-mobile"><!-- wp:column {"verticalAlignment":"center","width":"33%"} -->
<div class="wp-block-column is-vertically-aligned-center" style="flex-basis:33%"><!-- wp:navigation {"icon":"menu","layout":{"type":"flex","justifyContent":"left"},"fontSize":"18","fontFamily":"outfit"} /--></div>
<!-- /wp:column -->

<!-- wp:column {"verticalAlignment":"center","width":"33%"} -->
<div class="wp-block-column is-vertically-aligned-center" style="flex-basis:33%"><!-- wp:image {"align":"center","id":9,"width":"auto","height":"120px","sizeSlug":"full","linkDestination":"custom"} -->
<figure class="wp-block-image aligncenter size-full is-resized"><a href="<?php echo esc_url( home_url() ); ?>"><img src="<?php echo esc_url( get_template_directory_uri() ); ?>/assets/img/logo.svg" alt="" class="wp-image-9" style="width:auto;height:120px"/></a></figure>
<!-- /wp:image --></div>
<!-- /wp:column -->

<!-- wp:column {"verticalAlignment":"center","width":"33%"} -->
<div class="wp-block-column is-vertically-aligned-center" style="flex-basis:33%"><!-- wp:group {"style":{"spacing":{"blockGap":"0"}},"layout":{"type":"flex","flexWrap":"nowrap","justifyContent":"right"}} -->
<div class="wp-block-group"><!-- wp:search {"label":"Search","showLabel":false,"placeholder":"Search ...","buttonText":"Search","buttonPosition":"no-button","style":{"layout":{"selfStretch":"fixed","flexSize":null},"border":{"radius":"100px","width":"2px"}},"borderColor":"heading","className":"hide-on-sm"} /-->

<!-- wp:woocommerce/customer-account {"displayStyle":"icon_only","iconClass":"wc-block-customer-account__account-icon","className":"hide-on-sm op-p-0","fontSize":"14","style":{"spacing":{"margin":{"right":"0","left":"0","top":"0","bottom":"0"}},"layout":{"selfStretch":"fit","flexSize":null}}} /-->

<!-- wp:woocommerce/mini-cart {"miniCartIcon":"bag","addToCartBehaviour":"open_drawer","hasHiddenPrice":true,"cartAndCheckoutRenderStyle":"removed"} /--></div>
<!-- /wp:group --></div>
<!-- /wp:column --></div>
<!-- /wp:columns --></div>
<!-- /wp:group --></div>
<!-- /wp:group -->
