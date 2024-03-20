
CREATE DATABASE `warehouse`;

CREATE TABLE `users` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `item_idx` (`id`,`email`)
);


CREATE TABLE `order` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `item_id` bigint NOT NULL,
  `supplier_id` bigint NOT NULL,
  `quantity` int NOT NULL,
  `order_date` timestamp NOT NULL,
  `status` varchar(10) NOT NULL DEFAULT 'Active',
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` bigint NOT NULL DEFAULT '0',
  `updated_time` timestamp NULL DEFAULT NULL,
  `updated_by` bigint DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `order_idx` (`id`,`supplier_id`,`item_id`,`status`,`order_date`),
  KEY `item_id` (`item_id`),
  KEY `supplier_id` (`supplier_id`),
  CONSTRAINT `order_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`),
  CONSTRAINT `order_ibfk_2` FOREIGN KEY (`supplier_id`) REFERENCES `supplier` (`id`)
);


CREATE TABLE `items` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` varchar(250) DEFAULT NULL,
  `price` double NOT NULL DEFAULT '0',
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` bigint NOT NULL DEFAULT '0',
  `updated_time` timestamp NULL DEFAULT NULL,
  `updated_by` bigint DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `item_idx` (`id`,`name`)
);

CREATE TABLE `inventory` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `item_id` bigint NOT NULL,
  `quantity` int NOT NULL DEFAULT '0',
  `location` varchar(250) DEFAULT NULL,
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` bigint NOT NULL DEFAULT '0',
  `updated_time` timestamp NULL DEFAULT NULL,
  `updated_by` bigint DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `inventory_idx` (`id`,`item_id`,`location`)
);

CREATE TABLE `invoice` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `order_id` bigint NOT NULL,
  `amount` double NOT NULL DEFAULT '0',
  `payment_date` timestamp NOT NULL,
  `payment_mode` varchar(100) DEFAULT NULL,
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` bigint NOT NULL DEFAULT '0',
  `updated_time` timestamp NULL DEFAULT NULL,
  `updated_by` bigint DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `order_idx` (`id`,`order_id`,`payment_date`),
  KEY `order_id` (`order_id`),
  KEY `created_by` (`created_by`),
  KEY `updated_by` (`updated_by`),
  CONSTRAINT `invoice_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`),
  CONSTRAINT `invoice_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  CONSTRAINT `invoice_ibfk_3` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`)
);

CREATE TABLE `shipment` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `order_id` bigint NOT NULL,
  `shipment_date` timestamp NOT NULL,
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` bigint NOT NULL DEFAULT '0',
  `updated_time` timestamp NULL DEFAULT NULL,
  `updated_by` bigint DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `order_idx` (`id`,`order_id`,`shipment_date`),
  KEY `order_id` (`order_id`),
  CONSTRAINT `shipment_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`)
);

CREATE TABLE `supplier` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `contact_info` varchar(100) NOT NULL,
  `status` varchar(10) NOT NULL DEFAULT 'Active',
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` bigint NOT NULL DEFAULT '0',
  `updated_time` timestamp NULL DEFAULT NULL,
  `updated_by` bigint DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `supllier_idx` (`id`,`name`,`status`)
);




