<?php
/**
 * glamourhub: Theme Skins *
 *
 * @package glamourhub
 * @since glamourhub 1.0.0
 */

if ( ! function_exists( 'glamourhub_skin_scroll_to_top' ) ) :

	/**
	 * Enqueue Theme Styles and js.
	 */
	function glamourhub_skin_scroll_to_top() {
		?>

		<a href="#" class="op-scroll-to-top scroll-progress">
			<span class="scroll-icon">
				<i class="bi bi-chevron-up"></i>
			</span>
		</a>

		<?php

	}

endif;
add_action( 'wp_body_open', 'glamourhub_skin_scroll_to_top' );
