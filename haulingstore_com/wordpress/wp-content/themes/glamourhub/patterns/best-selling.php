<?php
/**
 * Title: Best Selling Products
 * Slug: glamourhub/best-selling-products
 * Categories: glamourhub
 *
 * @package glamourhub
 */

?>
<!-- wp:group {"style":{"spacing":{"padding":{"bottom":"var:preset|spacing|large"}}},"layout":{"type":"constrained"},"metadata":{"name":"Best Selling"}} -->
<div class="wp-block-group" style="padding-bottom:var(--wp--preset--spacing--large)"><!-- wp:group {"style":{"spacing":{"blockGap":"8px","margin":{"bottom":"var:preset|spacing|small"}}},"layout":{"type":"constrained"}} -->
<div class="wp-block-group" style="margin-bottom:var(--wp--preset--spacing--small)"><!-- wp:heading {"textAlign":"left"} -->
<h2 class="wp-block-heading has-text-align-left"><?php esc_html_e( 'Best Selling Products', 'glamourhub' ); ?></h2>
<!-- /wp:heading -->

<!-- wp:paragraph {"align":"left"} -->
<p class="has-text-align-left"><?php esc_html_e( 'Shop by our popular categories below, loream ipsum dolor amet', 'glamourhub' ); ?></p>
<!-- /wp:paragraph --></div>
<!-- /wp:group -->

<!-- wp:columns {"style":{"spacing":{"blockGap":{"left":"var:preset|spacing|small"}}}} -->
<div class="wp-block-columns"><!-- wp:column {"width":"33.32%"} -->
<div class="wp-block-column" style="flex-basis:33.32%"><!-- wp:cover {"url":"<?php echo esc_url( get_template_directory_uri() ); ?>/assets/img/banner-img-1.webp","id":11,"dimRatio":0,"minHeight":700,"minHeightUnit":"px","contentPosition":"top center","isDark":false,"style":{"spacing":{"padding":{"top":"var:preset|spacing|small","bottom":"var:preset|spacing|small","left":"var:preset|spacing|small","right":"var:preset|spacing|small"}}},"layout":{"type":"constrained"}} -->
<div class="wp-block-cover is-light has-custom-content-position is-position-top-center" style="padding-top:var(--wp--preset--spacing--small);padding-right:var(--wp--preset--spacing--small);padding-bottom:var(--wp--preset--spacing--small);padding-left:var(--wp--preset--spacing--small);min-height:700px"><span aria-hidden="true" class="wp-block-cover__background has-background-dim-0 has-background-dim"></span><img class="wp-block-cover__image-background wp-image-11" alt="" src="<?php echo esc_url( get_template_directory_uri() ); ?>/assets/img/banner-img-1.webp" data-object-fit="cover"/><div class="wp-block-cover__inner-container"><!-- wp:group {"style":{"spacing":{"blockGap":"var:preset|spacing|xx-small"}},"layout":{"type":"constrained"}} -->
<div class="wp-block-group"><!-- wp:paragraph {"align":"left","style":{"elements":{"link":{"color":{"text":"var:preset|color|secondary"}}}},"textColor":"secondary","fontSize":"18"} -->
<p class="has-text-align-left has-secondary-color has-text-color has-link-color has-18-font-size"><?php esc_html_e( 'SALE UP TO 50% OFF', 'glamourhub' ); ?></p>
<!-- /wp:paragraph -->

<!-- wp:heading {"textAlign":"left","level":3,"style":{"typography":{"fontStyle":"normal","fontWeight":"600"}}} -->
<h3 class="wp-block-heading has-text-align-left" style="font-style:normal;font-weight:600"><?php esc_html_e( 'Summer Sale Collection', 'glamourhub' ); ?></h3>
<!-- /wp:heading -->

<!-- wp:buttons {"layout":{"type":"flex","justifyContent":"left"},"style":{"spacing":{"margin":{"top":"24px"}}}} -->
<div class="wp-block-buttons" style="margin-top:24px"><!-- wp:button {"textAlign":"center","textColor":"heading","style":{"border":{"radius":"8px"},"spacing":{"padding":{"top":"8px","bottom":"8px"}},"elements":{"link":{"color":{"text":"var:preset|color|heading"}}}},"className":"is-style-fill"} -->
<div class="wp-block-button is-style-fill"><a class="wp-block-button__link has-heading-color has-text-color has-link-color has-text-align-center wp-element-button" style="border-radius:8px;padding-top:8px;padding-bottom:8px"><?php esc_html_e( 'Shop now', 'glamourhub' ); ?></a></div>
<!-- /wp:button --></div>
<!-- /wp:buttons --></div>
<!-- /wp:group --></div></div>
<!-- /wp:cover --></div>
<!-- /wp:column -->

<!-- wp:column {"width":"66.68%"} -->
<div class="wp-block-column" style="flex-basis:66.68%"><!-- wp:query {"queryId":0,"query":{"perPage":"6","pages":0,"offset":0,"postType":"product","order":"asc","orderBy":"title","author":"","search":"","exclude":[],"sticky":"","inherit":false,"__woocommerceAttributes":[],"__woocommerceStockStatus":["instock","outofstock","onbackorder"]},"namespace":"woocommerce/product-query","layout":{"type":"default"}} -->
<div class="wp-block-query"><!-- wp:post-template {"className":"products-block-post-template","layout":{"type":"grid","columnCount":3},"__woocommerceNamespace":"woocommerce/product-query/product-template"} -->
<!-- wp:woocommerce/product-image {"imageSizing":"thumbnail","isDescendentOfQueryLoop":true,"width":"","height":""} /-->

<!-- wp:post-title {"textAlign":"left","level":3,"isLink":true,"style":{"spacing":{"margin":{"bottom":"4px","top":"8px"}},"elements":{"link":{"color":{"text":"var:preset|color|heading"}}},"typography":{"fontStyle":"normal","fontWeight":"600"}},"fontSize":"18","__woocommerceNamespace":"woocommerce/product-query/product-title"} /-->

<!-- wp:group {"layout":{"type":"flex","flexWrap":"nowrap","justifyContent":"space-between"}} -->
<div class="wp-block-group"><!-- wp:woocommerce/product-price {"isDescendentOfQueryLoop":true,"textAlign":"left","style":{"spacing":{"padding":{"top":"0","bottom":"0"},"margin":{"top":"0","bottom":"0"}}}} /-->

<!-- wp:woocommerce/product-button {"textAlign":"left","isDescendentOfQueryLoop":true,"fontSize":"16"} /--></div>
<!-- /wp:group -->
<!-- /wp:post-template -->

<!-- wp:query-no-results -->
<!-- wp:paragraph {"placeholder":"Add text or blocks that will display when a query returns no results."} -->
<p></p>
<!-- /wp:paragraph -->
<!-- /wp:query-no-results --></div>
<!-- /wp:query --></div>
<!-- /wp:column --></div>
<!-- /wp:columns --></div>
<!-- /wp:group -->
