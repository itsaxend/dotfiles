<?php
/**
 * Title: 404 Page
 * Slug: glamourhub/error
 * Categories: glamourhub
 *
 * @package glamourhub
 */

?>
<!-- wp:group {"layout":{"type":"default"},"metadata":{"name":"404 Wrapper"}} -->
<div class="wp-block-group"><!-- wp:cover {"overlayColor":"bd-color","minHeight":100,"minHeightUnit":"vh","isDark":false} -->
<div class="wp-block-cover is-light" style="min-height:100vh"><span aria-hidden="true" class="wp-block-cover__background has-bd-color-background-color has-background-dim-100 has-background-dim"></span><div class="wp-block-cover__inner-container"><!-- wp:group {"style":{"spacing":{"blockGap":"var:preset|spacing|x-small"}},"layout":{"type":"constrained"}} -->
<div class="wp-block-group"><!-- wp:group {"layout":{"type":"constrained"}} -->
<div class="wp-block-group"><!-- wp:heading {"fontSize":"90"} -->
<h2 class="wp-block-heading has-90-font-size">404</h2>
<!-- /wp:heading --></div>
<!-- /wp:group -->

<!-- wp:group {"layout":{"type":"constrained"}} -->
<div class="wp-block-group"><!-- wp:columns {"verticalAlignment":"center","style":{"spacing":{"blockGap":{"top":"var:preset|spacing|medium","left":"var:preset|spacing|medium"}}}} -->
<div class="wp-block-columns are-vertically-aligned-center"><!-- wp:column {"verticalAlignment":"center","style":{"spacing":{"blockGap":"var:preset|spacing|x-small"}}} -->
<div class="wp-block-column is-vertically-aligned-center"><!-- wp:heading -->
<h2 class="wp-block-heading"><?php esc_html_e( 'Something’s wrong here…', 'glamourhub' ); ?></h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p><?php esc_html_e( 'There may be a misspelling in the URL entered, or the page you were looking for doesn\'t exist. Check out our help center or head back to home.', 'glamourhub' ); ?></p>
<!-- /wp:paragraph -->

<!-- wp:buttons {"style":{"spacing":{"margin":{"top":"24px"}}}} -->
<div class="wp-block-buttons" style="margin-top:24px"><!-- wp:button -->
<div class="wp-block-button"><a class="wp-block-button__link wp-element-button" href="<?php echo esc_url( home_url() ); ?>">Back to Homepage</a></div>
<!-- /wp:button --></div>
<!-- /wp:buttons --></div>
<!-- /wp:column -->

<!-- wp:column {"verticalAlignment":"center"} -->
<div class="wp-block-column is-vertically-aligned-center"></div>
<!-- /wp:column --></div>
<!-- /wp:columns --></div>
<!-- /wp:group --></div>
<!-- /wp:group --></div></div>
<!-- /wp:cover --></div>
<!-- /wp:group -->
