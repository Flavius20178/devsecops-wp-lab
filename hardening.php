<?php

/**
 * WordPress hardening that is loaded automatically as a must-use plugin.
 */

if (!defined('ABSPATH')) {
    http_response_code(403);
    exit;
}

add_filter('login_errors', '__return_empty_string');

add_action('init', static function (): void {
    if (isset($_GET['author'])) {
        status_header(404);
        nocache_headers();
        exit;
    }
});

add_filter('rest_endpoints', static function (array $endpoints): array {
    unset($endpoints['/wp/v2/users'], $endpoints['/wp/v2/users/(?P<id>[\d]+)']);

    return $endpoints;
});
