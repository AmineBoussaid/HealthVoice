<?php
return [
    'view_manager' => [
        'template_path_stack' => [
            dirname(__DIR__) . '/view',
        ],
    ],
    'router' => [
        'routes' => [
            'admin' => [
                'child_routes' => [
                    'health-voice' => [
                        'type' => 'Literal',
                        'options' => [
                            'route' => '/health-voice',
                            'defaults' => [
                                '__NAMESPACE__' => 'MyModule\Controller',
                                'controller' => 'Index',
                                'action' => 'index',
                            ],
                        ],
                    ],
                ],
            ],
        ],
    ],
    'controllers' => [
        'invokables' => [
            'MyModule\Controller\Index' => 'MyModule\Controller\IndexController',
        ],
    ],
    'navigation' => [
        'AdminModule' => [
            [
                'label' => 'HealthVoice AI',
                'route' => 'admin/health-voice',
                'resource' => 'MyModule\Controller\Index',
                'privilege' => 'index',
                'class' => 'health-voice-nav',
            ],
        ],
    ],
];
