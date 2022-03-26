<?php
/**
 * Copyright (c) 2018. Aliznet tous droit reservé
 * Date : 06/03/18 11:36
 * Autor : jelhammoumi
 *
 *
 */

return array(
    'backend' =>
        array(
            'frontName' => 'admin',
        ),
    'db' =>
        array(
            'connection' =>
                array(
                    'default' =>
                        array(
                            'host' => '{CONFIG_DB_HOST}',
                            'dbname' => '{CONFIG_DB_NAME}',
                            'username' => '{CONFIG_DB_USERNAME}',
                            'password' => '{CONFIG_DB_PASSWORD}',
                            'active' => '1',
                            'persistent' => '1',
                        ),
                ),
            'table_prefix' => '',
        ),
    'crypt' =>
        array(
            'key' => '{CONFIG_MAGENTO_CRYPT_KEY}',
        ),
    'resource' =>
        array(
            'default_setup' =>
                array(
                    'connection' => 'default',
                ),
        ),
    'x-frame-options' => 'SAMEORIGIN',
    'MAGE_MODE' => 'production',
    'cache_types' =>
        array(
            'config' => 1,
            'layout' => 1,
            'block_html' => 1,
            'collections' => 1,
            'reflection' => 1,
            'db_ddl' => 1,
            'eav' => 1,
            'customer_notification' => 1,
            'target_rule' => 1,
            'full_page' => 1,
            'config_integration' => 1,
            'config_integration_api' => 1,
            'translate' => 1,
            'config_webservice' => 1,
            'compiled_config' => 1,
        ),
    'cache' =>
        array(
            'frontend' =>
                array(
                    //configure Magento to use Redis for default cache
                    'default' =>
                        array(
                            'backend' => 'Cm_Cache_Backend_Redis',
                            'backend_options' =>
                                array(
                                    'server' => '{CONFIG_REDIS_CONF_CACHE_SERVER}',
                                    'port' => '{CONFIG_REDIS_CONF_CACHE_PORT}',
                                    'database' => '1',
                                    'timeout' => '2.5',
                                    'persistent_identifier' => '',
                                    'compression_threshold' => '2048',
                                    'compression_library' => 'gzip',
                                    'log_level' => '1',
                                    'max_concurrency' => '6',
                                    'break_after_frontend' => '5',
                                    'break_after_adminhtml' => '30',
                                    'first_lifetime' => '600',
                                    'bot_first_lifetime' => '60',
                                    'bot_lifetime' => '7200',
                                    'disable_locking' => '0',
                                    'min_lifetime' => '60',
                                    'max_lifetime' => '2592000',
									'password' => '{CONFIG_REDIS_CONF_CACHE_PASSWORD}'
                                ),
                        ),
                    //configure Magento to use Redis for full page storage
                    'page_cache' =>
                        array(
                            'backend' => 'Cm_Cache_Backend_Redis',
                            'backend_options' =>
                                array(
                                    'server' => '{CONFIG_REDIS_FPC_CACHE_SERVER}',
                                    'port' => '{CONFIG_REDIS_FPC_CACHE_PORT}',
                                    'database' => '1',
                                    'timeout' => '2.5',
                                    'persistent_identifier' => '',
                                    'compression_threshold' => '2048',
                                    'compression_library' => 'gzip',
                                    'log_level' => '1',
                                    'max_concurrency' => '6',
                                    'break_after_frontend' => '5',
                                    'break_after_adminhtml' => '30',
                                    'first_lifetime' => '600',
                                    'bot_first_lifetime' => '60',
                                    'bot_lifetime' => '7200',
                                    'disable_locking' => '0',
                                    'min_lifetime' => '60',
                                    'max_lifetime' => '2592000',
									'password' => '{CONFIG_REDIS_FPC_CACHE_PASSWORD}'
                                ),
                        ),
                )
        ),
    'install' =>
        array(
            'date' => 'Thu, 07 Sep 2017 08:37:10 +0000',
        ),
    'system' =>
        array(
            'default' =>
                array(
                    'dev' =>
                        array(
                            'debug' =>
                                array(
                                    'debug_logging' => '0',
                                ),
                        ),
                ),
        ),
    //configure Magento to use Redis for session storage
    'session' =>
        array(
            'save' => 'redis',
            'redis' =>
                array(
                    'host' => '{CONFIG_REDIS_SESSION_CACHE_SERVER}',
                    'port' => '{CONFIG_REDIS_SESSION_CACHE_PORT}',
                    'database' => '1',
                    'timeout' => '2.5',
                    'persistent_identifier' => '',
                    'compression_threshold' => '2048',
                    'compression_library' => 'gzip',
                    'log_level' => '1',
                    'max_concurrency' => '6',
                    'break_after_frontend' => '5',
                    'break_after_adminhtml' => '30',
                    'first_lifetime' => '600',
                    'bot_first_lifetime' => '60',
                    'bot_lifetime' => '7200',
                    'disable_locking' => '0',
                    'min_lifetime' => '60',
                    'max_lifetime' => '2592000',
					'password' => '{CONFIG_REDIS_SESSION_CACHE_PASSWORD}'
                )
        ),
    'environment' => 'preprod'
);
