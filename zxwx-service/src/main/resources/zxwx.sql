/*
Navicat MySQL Data Transfer

Source Server         : 106.13.128.218
Source Server Version : 50725
Source Host           : 106.13.128.218:3306
Source Database       : zxwx

Target Server Type    : MYSQL
Target Server Version : 50725
File Encoding         : 65001

Date: 2019-07-04 10:54:29
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for cSessionInfo
-- ----------------------------
DROP TABLE IF EXISTS `cSessionInfo`;
CREATE TABLE `cSessionInfo` (
  `open_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uuid` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `skey` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_visit_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `session_key` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_info` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`open_id`),
  KEY `openid` (`open_id`) USING BTREE,
  KEY `skey` (`skey`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='会话管理用户信息';

-- ----------------------------
-- Records of cSessionInfo
-- ----------------------------
INSERT INTO `cSessionInfo` VALUES ('oKpV75avmo2vIwSzPeMdBiXbzatE', '912d7986-bb91-4700-b0b7-028646fd9a7d', '53082cdd00290960e41347809cdd9180eed45ce6', '2019-04-18 19:40:54', '2019-04-19 06:04:09', 'wT2KCPWWQ6yjAqY15PDsag==', '{\"openId\":\"oKpV75avmo2vIwSzPeMdBiXbzatE\",\"nickName\":\"金号金果\",\"gender\":2,\"language\":\"zh_CN\",\"city\":\"Handan\",\"province\":\"Hebei\",\"country\":\"China\",\"avatarUrl\":\"https://wx.qlogo.cn/mmopen/vi_32/Em33CVZFn1ia3lIq3zDj7iaJ2EDzRpsnb5wANbjAUCnBgc325jfMZmJ2oq4N4pG3qWChz3U5icNfokZ3jxBeB6JLA/132\",\"watermark\":{\"timestamp\":1555587654,\"appid\":\"wxa3ad3b6097ef88a5\"}}');
INSERT INTO `cSessionInfo` VALUES ('oKpV75bfcxbqK1gxekKXaZ5cKmmA', '31d65d44-f38f-4ab2-83a6-154583c47ccc', '90459f1fcf6137f51b0c88b3a1604f8704d6eb89', '2019-04-20 11:25:12', '2019-04-20 21:19:06', 'Dqcnx4+6IejjZ06f6Ow7VQ==', '{\"openId\":\"oKpV75bfcxbqK1gxekKXaZ5cKmmA\",\"nickName\":\"melody\",\"gender\":1,\"language\":\"zh_CN\",\"city\":\"\",\"province\":\"\",\"country\":\"Norway\",\"avatarUrl\":\"https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJ5crOqJ7PHqlicNicT2jzbujhl99aqIhp5QWXo7dVclib1r0wF61TsDcQddBUiamXKwHo5JiaJwiaghKYA/132\",\"watermark\":{\"timestamp\":1555730711,\"appid\":\"wxa3ad3b6097ef88a5\"}}');
INSERT INTO `cSessionInfo` VALUES ('oKpV75bK2Vq1ELl-595opTHm7PTA', 'fb03177c-3591-4685-9147-2bb632d8afc6', '0a614985dfa9e4cf7aff0b68aa697a1659a01d05', '2019-04-24 11:58:14', '2019-04-24 11:58:26', 'kMuIlRX7ThRLxJ6R9M58vA==', '{\"openId\":\"oKpV75bK2Vq1ELl-595opTHm7PTA\",\"nickName\":\"陈政倩\",\"gender\":0,\"language\":\"zh_CN\",\"city\":\"\",\"province\":\"\",\"country\":\"\",\"avatarUrl\":\"https://wx.qlogo.cn/mmhead/Jo4XrsnwVczqvjfVKkHzGnJPV6ZbcEDEAQ2XC9sh6AQ/132\",\"watermark\":{\"timestamp\":1556078292,\"appid\":\"wxa3ad3b6097ef88a5\"}}');
INSERT INTO `cSessionInfo` VALUES ('oKpV75bRb9qJ6rdIylTBw1dEYEGc', '77434aad-2403-4573-99bf-2602679c5f87', 'd7aea31ee9f727415fc6ee8392fd69a1fe837db7', '2019-04-19 18:39:14', '2019-04-19 18:39:15', 'DgW42rAy6XfBRX5BA9DpYA==', '{\"openId\":\"oKpV75bRb9qJ6rdIylTBw1dEYEGc\",\"nickName\":\"李育泉\",\"gender\":0,\"language\":\"zh_CN\",\"city\":\"\",\"province\":\"\",\"country\":\"\",\"avatarUrl\":\"https://wx.qlogo.cn/mmhead/XjAc2SwbWQMc8um76ueYJic7ibtyonLkbXzz81fQXYAmY/132\",\"watermark\":{\"timestamp\":1555670354,\"appid\":\"wxa3ad3b6097ef88a5\"}}');
INSERT INTO `cSessionInfo` VALUES ('oKpV75brqLrvzYiC18lZx0CMmQzI', 'cf2ecb05-f236-4b74-9692-b22a6ad453bc', 'd0433bdcf2befc625510793536d4e1d85a1a59c5', '2019-05-03 03:40:02', '2019-05-03 03:40:03', 'sn75ommNRvdOzd0DzPzToQ==', '{\"openId\":\"oKpV75brqLrvzYiC18lZx0CMmQzI\",\"nickName\":\"张文宏\",\"gender\":0,\"language\":\"zh_CN\",\"city\":\"\",\"province\":\"\",\"country\":\"\",\"avatarUrl\":\"https://wx.qlogo.cn/mmhead/CAg7iaBvSKxSib9x1hicvsoVv6pfGfQWd27xB5jemtwx9M/132\",\"watermark\":{\"timestamp\":1556826002,\"appid\":\"wxa3ad3b6097ef88a5\"}}');
INSERT INTO `cSessionInfo` VALUES ('oKpV75cB0qPUc_hTFq8Uo6M3Awuo', 'b28d3415-a488-4b83-81bf-08de14c53b92', 'f6d4380e35ee2c8d4c92de2ba2f947654f19f0ae', '2019-04-24 00:52:14', '2019-04-24 00:58:45', 'utx+JojGPIoVc+4Y4kEfvA==', '{\"openId\":\"oKpV75cB0qPUc_hTFq8Uo6M3Awuo\",\"nickName\":\"黄文隆\",\"gender\":0,\"language\":\"zh_CN\",\"city\":\"\",\"province\":\"\",\"country\":\"\",\"avatarUrl\":\"https://wx.qlogo.cn/mmhead/yrlEicZRMawLicSxZXwGT6cJPicicj07l5ib6uQ1l2paZRgo/132\",\"watermark\":{\"timestamp\":1556038334,\"appid\":\"wxa3ad3b6097ef88a5\"}}');
INSERT INTO `cSessionInfo` VALUES ('oKpV75d58devTjwu6p5y74bHKUUk', 'f165988a-483a-44a2-a02d-fe59751896e0', '04908d0a3a46a8623800d15baa9e3dab130ff064', '2019-04-25 17:49:58', '2019-04-25 17:50:00', 'ppsj9NNPTD2JNkatgttopg==', '{\"openId\":\"oKpV75d58devTjwu6p5y74bHKUUk\",\"nickName\":\"翁惠珠\",\"gender\":0,\"language\":\"zh_CN\",\"city\":\"\",\"province\":\"\",\"country\":\"\",\"avatarUrl\":\"https://wx.qlogo.cn/mmhead/rM7w4VxbZ6aMAWFR4fNZ0aUMGGko1K8lFVPqgiclnje4/132\",\"watermark\":{\"timestamp\":1556185798,\"appid\":\"wxa3ad3b6097ef88a5\"}}');
INSERT INTO `cSessionInfo` VALUES ('oKpV75dF3yT_KyGtLuWVLZBhrIvc', '640faf5b-9073-4807-82e8-d10584c4532e', '9f953c18440e747a8de1502bd4e6d6d4899e0774', '2019-04-24 03:47:52', '2019-04-24 03:47:53', 'psraL+r3Km6yWffJNLN25A==', '{\"openId\":\"oKpV75dF3yT_KyGtLuWVLZBhrIvc\",\"nickName\":\"林家纶\",\"gender\":0,\"language\":\"zh_CN\",\"city\":\"\",\"province\":\"\",\"country\":\"\",\"avatarUrl\":\"https://wx.qlogo.cn/mmhead/R5NLiarpuCvmvanTCzsdkL2LC3rS3WWTLLaAzbOyRWEI/132\",\"watermark\":{\"timestamp\":1556048871,\"appid\":\"wxa3ad3b6097ef88a5\"}}');
INSERT INTO `cSessionInfo` VALUES ('oKpV75e8XsZJ0ZMoHG2l-2YB349g', '6612a2db-4172-4fe8-8276-3ae346f540fe', '9ff2796dde5231583158ef30fd3d4d825f495f8f', '2019-04-25 02:38:13', '2019-04-25 02:38:15', 'y3eaVx2Ht0rHX0JjwWBXZA==', '{\"openId\":\"oKpV75e8XsZJ0ZMoHG2l-2YB349g\",\"nickName\":\"吴佳瑞\",\"gender\":0,\"language\":\"zh_CN\",\"city\":\"\",\"province\":\"\",\"country\":\"\",\"avatarUrl\":\"https://wx.qlogo.cn/mmhead/y2LTzicPJyUzbaibczCKiaKxXNuC8ARUiaBCDJrEQbjuT2E/132\",\"watermark\":{\"timestamp\":1556131093,\"appid\":\"wxa3ad3b6097ef88a5\"}}');
INSERT INTO `cSessionInfo` VALUES ('oKpV75Qldw27Rz6_wz2Q1haV30lM', '56182a79-a1e9-49b0-9662-93f6c0246156', 'eece58cdf932ddabd48955b3b0d445b36db1c364', '2019-04-16 12:14:13', '2019-04-17 14:36:52', 'KvCGoKl6HRGINXi7QJWX/Q==', '{\"openId\":\"oKpV75Qldw27Rz6_wz2Q1haV30lM\",\"nickName\":\"?\",\"gender\":1,\"language\":\"zh_CN\",\"city\":\"Chaoyang\",\"province\":\"Beijing\",\"country\":\"China\",\"avatarUrl\":\"https://wx.qlogo.cn/mmopen/vi_32/qXbgaJc4761ukxLxZF0XGPux4rthSs5lDfhib9gMOugyqzia56UDIbiaMNPYxK7icHwEhvhibISPia8fU86n78JjEE6A/132\",\"watermark\":{\"timestamp\":1555388053,\"appid\":\"wxa3ad3b6097ef88a5\"}}');
INSERT INTO `cSessionInfo` VALUES ('oKpV75QlYcK0o6lnwiKwK9tkRyA8', 'a9f74a8c-80b9-472e-a04c-99397f8962fa', 'b45d8a83f4c4e337544c1d1f6fbf20a4d48bade5', '2019-04-23 09:04:49', '2019-04-23 12:49:53', 'h8pC//XP/pw+jjRHRaofDg==', '{\"openId\":\"oKpV75QlYcK0o6lnwiKwK9tkRyA8\",\"nickName\":\"A-一手女装批发小宁\",\"gender\":1,\"language\":\"zh_CN\",\"city\":\"Xingtai\",\"province\":\"Hebei\",\"country\":\"China\",\"avatarUrl\":\"https://wx.qlogo.cn/mmopen/vi_32/emhMvargkfuur8sxGGNzxgByqWVOGHQGQe39qr49OHVCxibV3fAaGglicZ9tjSq43ibXl1aE9eqmFxT3z3JF3U9gA/132\",\"watermark\":{\"timestamp\":1555981488,\"appid\":\"wxa3ad3b6097ef88a5\"}}');
INSERT INTO `cSessionInfo` VALUES ('oKpV75Qn6p826crnKUMpLAWFczNs', '78f0323a-9fb9-4334-ad91-0bcb3eb5ab92', 'f0bced90b60d9f9afb0ab7a216db7bb5336ba14c', '2019-04-20 19:42:47', '2019-04-20 19:55:23', 'Lzt4Yn2GwITzuXPqYHVNWA==', '{\"openId\":\"oKpV75Qn6p826crnKUMpLAWFczNs\",\"nickName\":\"Evan\'\",\"gender\":1,\"language\":\"zh_CN\",\"city\":\"Handan\",\"province\":\"Hebei\",\"country\":\"China\",\"avatarUrl\":\"https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83epib0pBowbCr9qULP0MmicU9KDxYOUJgvKzS6WcicIU8970d3AjIQmQ36a0diaRFPygTXWoiaS7ibRqSpKQ/132\",\"watermark\":{\"timestamp\":1555760566,\"appid\":\"wxa3ad3b6097ef88a5\"}}');
INSERT INTO `cSessionInfo` VALUES ('oKpV75QvVyI-54QUaf-y9HJPzBZ4', 'd8051e45-d545-4af0-8b3d-975233cd4229', 'fae2c0564bad8dcd9c8684ffa4fa389a644cbfb3', '2019-04-25 00:37:06', '2019-04-25 00:37:07', '8Ufo+A6cXtRIzvV/m2e7kA==', '{\"openId\":\"oKpV75QvVyI-54QUaf-y9HJPzBZ4\",\"nickName\":\"杨佩芳\",\"gender\":0,\"language\":\"zh_CN\",\"city\":\"\",\"province\":\"\",\"country\":\"\",\"avatarUrl\":\"https://wx.qlogo.cn/mmhead/qUVp3XMOFJBuWkxZsefibf7GNVC3wk08dnk6bkOALQNY/132\",\"watermark\":{\"timestamp\":1556123826,\"appid\":\"wxa3ad3b6097ef88a5\"}}');
INSERT INTO `cSessionInfo` VALUES ('oKpV75QXaiyfynjoFgjKD0a-YW-I', '541fe2af-d569-4b90-9f90-c58f903f28e3', '870970d496aa58872d5e464dc276079f5148ba88', '2019-04-17 13:06:45', '2019-04-21 15:20:50', 'A9VcT71Xe3dQOjiVVBiWrQ==', '{\"openId\":\"oKpV75QXaiyfynjoFgjKD0a-YW-I\",\"nickName\":\"凯旋（亿凡魔兽门票专业团）\",\"gender\":1,\"language\":\"zh_CN\",\"city\":\"Handan\",\"province\":\"Hebei\",\"country\":\"China\",\"avatarUrl\":\"https://wx.qlogo.cn/mmopen/vi_32/tJDffArZP1PdzYpZ2m6fQm2d6ogCuJhrrWLicLaVRAlhTXztSEElpD3hk1iboHYTYSe8gY8hNdNPWiaw1jWVW1yLQ/132\",\"watermark\":{\"timestamp\":1555477604,\"appid\":\"wxa3ad3b6097ef88a5\"}}');
INSERT INTO `cSessionInfo` VALUES ('oKpV75RdCQm6vFbxpseLG4OU4A1I', 'dd50ec7a-16ba-4734-ae53-bad0fe7563a4', '12f488d3203c2a017727a9cda47cb17ecba44e77', '2019-04-19 22:33:13', '2019-04-19 22:33:17', 'gyIHKehQnj1f3WVTYrorKA==', '{\"openId\":\"oKpV75RdCQm6vFbxpseLG4OU4A1I\",\"nickName\":\"王恩龙\",\"gender\":0,\"language\":\"zh_CN\",\"city\":\"\",\"province\":\"\",\"country\":\"\",\"avatarUrl\":\"https://wx.qlogo.cn/mmhead/aaYe9jQHOMx5kwFeF4kibkGDdN5QDuhlCoWIokBZ2tjU/132\",\"watermark\":{\"timestamp\":1555684393,\"appid\":\"wxa3ad3b6097ef88a5\"}}');
INSERT INTO `cSessionInfo` VALUES ('oKpV75RNwTtLZuEx816t3QB87m9A', '6d3a49bf-91b8-40ea-99dd-c5f868fe48ef', 'b171c5b9ff60c0c4fe2f727143155fb1db6f4bea', '2019-04-16 11:55:19', '2019-04-16 11:55:24', '0ZiSOARnAFrJ1Qcsy3Rgww==', '{\"openId\":\"oKpV75RNwTtLZuEx816t3QB87m9A\",\"nickName\":\"蔡依婷\",\"gender\":0,\"language\":\"zh_CN\",\"city\":\"\",\"province\":\"\",\"country\":\"\",\"avatarUrl\":\"https://wx.qlogo.cn/mmhead/ZcR6fGAhDaLFdIq2X6iaM3mh9RYq1zfhkE3liazypS5q4/132\",\"watermark\":{\"timestamp\":1555386919,\"appid\":\"wxa3ad3b6097ef88a5\"}}');
INSERT INTO `cSessionInfo` VALUES ('oKpV75Rrus-QBQIbLQuWvHGUS1_s', '3d06d5ac-3add-4259-ace2-835eb6866c85', '95a37852b8c9c017b57c79f035a8d629ec6e2cdd', '2019-05-10 04:03:08', '2019-05-10 04:03:09', 'S0u2g9xq/eyEkhORrn/QVQ==', '{\"openId\":\"oKpV75Rrus-QBQIbLQuWvHGUS1_s\",\"nickName\":\"陈怡盈\",\"gender\":0,\"language\":\"zh_CN\",\"city\":\"\",\"province\":\"\",\"country\":\"\",\"avatarUrl\":\"https://wx.qlogo.cn/mmhead/fx1ia0pk6ibmYmC4XRib5EPvJQZqD2dYhmVFDo8x9wYkyg/132\",\"watermark\":{\"timestamp\":1557432187,\"appid\":\"wxa3ad3b6097ef88a5\"}}');
INSERT INTO `cSessionInfo` VALUES ('oKpV75S4AP8fUBZ_YsBNbx01X4I8', 'ed1b7655-1fa8-4f09-88da-1ea8be5dcfdd', '3ab11e4623f2fd573befb39edada90951f663530', '2019-04-17 15:02:28', '2019-04-17 15:03:09', 'ehl6+8f8XMtFID7BJmR5pA==', '{\"openId\":\"oKpV75S4AP8fUBZ_YsBNbx01X4I8\",\"nickName\":\"陈婉璇\",\"gender\":0,\"language\":\"zh_CN\",\"city\":\"\",\"province\":\"\",\"country\":\"\",\"avatarUrl\":\"https://wx.qlogo.cn/mmhead/jibwIN3cqewwpqn08XOobqFffTUZs9uwX6ExZx7xteIQ/132\",\"watermark\":{\"timestamp\":1555484547,\"appid\":\"wxa3ad3b6097ef88a5\"}}');
INSERT INTO `cSessionInfo` VALUES ('oKpV75Sc_T_adXrbUEoL9h8w467g', '373ecb10-e1b3-4e58-968f-a6a177bc61bb', '13ad50f9b9e2d2976710032934fc4bba115c1c0e', '2019-04-25 00:38:20', '2019-04-25 00:38:25', 'CEYAAq1r8+f47u+vnQpqOA==', '{\"openId\":\"oKpV75Sc_T_adXrbUEoL9h8w467g\",\"nickName\":\"李中冰\",\"gender\":0,\"language\":\"zh_CN\",\"city\":\"\",\"province\":\"\",\"country\":\"\",\"avatarUrl\":\"https://wx.qlogo.cn/mmhead/9G03ZCTWMIIvqpueN52VSFwiah394udeFb0DDKApalJ0/132\",\"watermark\":{\"timestamp\":1556123900,\"appid\":\"wxa3ad3b6097ef88a5\"}}');
INSERT INTO `cSessionInfo` VALUES ('oKpV75SeNvcv4C68syJOCvAKf44I', 'cd702398-c5ac-44d7-9ccc-2bec67543992', '781b2c9127079b76767ef62ff1903913956cb1b6', '2019-05-01 04:16:32', '2019-05-01 04:16:41', 'XtvQQJIOx9hM4fz0WZ+O1A==', '{\"openId\":\"oKpV75SeNvcv4C68syJOCvAKf44I\",\"nickName\":\"荆彦璋\",\"gender\":0,\"language\":\"zh_CN\",\"city\":\"\",\"province\":\"\",\"country\":\"\",\"avatarUrl\":\"https://wx.qlogo.cn/mmhead/FIXyyk7kSRh2FLYFibAceibaiaNMelkmlus6L0OTpDVRicM/132\",\"watermark\":{\"timestamp\":1556655392,\"appid\":\"wxa3ad3b6097ef88a5\"}}');
INSERT INTO `cSessionInfo` VALUES ('oKpV75SJbrO-z4GmIutdoMDS2mL8', '88a707fd-642d-4807-b87a-fc494673410e', 'bb8cefbc4d3f34ab676af27f5e6cba82284f1d2c', '2019-04-16 17:56:38', '2019-05-16 19:37:42', 'VKB/fpEdF53bgXEtiTlkQA==', '{\"openId\":\"oKpV75SJbrO-z4GmIutdoMDS2mL8\",\"nickName\":\"爱笑的人\",\"gender\":2,\"language\":\"zh_CN\",\"city\":\"Handan\",\"province\":\"Hebei\",\"country\":\"China\",\"avatarUrl\":\"https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJdVmib8yKkJrQsNI98X7w7TvLm4gTqMXxb3jjKqNJicxicmhGN9EI6dblW4O20WXcgb2hy8GEjrcO2Q/132\",\"watermark\":{\"timestamp\":1555408598,\"appid\":\"wxa3ad3b6097ef88a5\"}}');
INSERT INTO `cSessionInfo` VALUES ('oKpV75SJc0NBvKzzswTx0e_CZm20', '93445a28-036a-4026-928b-828721988779', '65dfd060d7d54e97305a404485fd7943b96b391e', '2019-04-18 15:15:23', '2019-04-18 15:17:12', 'ZQCkXxdCbwqkaYRvJnnt9Q==', '{\"openId\":\"oKpV75SJc0NBvKzzswTx0e_CZm20\",\"nickName\":\"高咏钰\",\"gender\":0,\"language\":\"zh_CN\",\"city\":\"\",\"province\":\"\",\"country\":\"\",\"avatarUrl\":\"https://wx.qlogo.cn/mmhead/Rn20iaFD7k1jcuib9AsNsaO6mpYgugTHuevJLOoOicdN3I/132\",\"watermark\":{\"timestamp\":1555571723,\"appid\":\"wxa3ad3b6097ef88a5\"}}');
INSERT INTO `cSessionInfo` VALUES ('oKpV75SYRn8fgTdmUgU92JqEqMRY', '67f96949-7124-4ade-94a3-6c61ac4a01ce', '039c67c01459e8317370c1e242477a06c2fda8ab', '2019-04-20 09:03:42', '2019-05-02 17:22:19', '/4QWUh8EbgZ4tmBAx6BMqg==', '{\"openId\":\"oKpV75SYRn8fgTdmUgU92JqEqMRY\",\"nickName\":\"冰海\",\"gender\":1,\"language\":\"zh_CN\",\"city\":\"Tongzhou\",\"province\":\"Beijing\",\"country\":\"China\",\"avatarUrl\":\"https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIxUHqiaP16zGmnxzgJIaNR4M1Leo5iaNUYhKlkH1FQTM3t6gvpmxIH5a2E9690B97HrtH0nbniaLNibQ/132\",\"watermark\":{\"timestamp\":1555722221,\"appid\":\"wxa3ad3b6097ef88a5\"}}');
INSERT INTO `cSessionInfo` VALUES ('oKpV75V9uBLgbNxeCkEGoN4xze4k', 'b5e1898b-9fac-4c5f-b1d2-23a535b28661', '7ade3042f89c67c816be4760c8fe5ee2d59c4706', '2019-04-14 22:11:42', '2019-05-16 20:07:36', 'o56Vmh5vIVbUcttIAyNp7A==', '{\"openId\":\"oKpV75V9uBLgbNxeCkEGoN4xze4k\",\"nickName\":\"源点\",\"gender\":1,\"language\":\"zh_CN\",\"city\":\"Handan\",\"province\":\"Hebei\",\"country\":\"China\",\"avatarUrl\":\"https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83eofBEh8ftcmZ0oePt4GLUdwgo7M5cuwwy68eOGKWgukcKYXt9P8thoTE1Uhm7IPrJQrR4ptIA9Kag/132\",\"watermark\":{\"timestamp\":1555251102,\"appid\":\"wxa3ad3b6097ef88a5\"}}');
INSERT INTO `cSessionInfo` VALUES ('oKpV75VnDYhfWE-WJYm29d4OklPg', 'e1e45703-1c2e-478b-a323-1dcb949dbdd5', '7d7e3de747c48c4cbc47fea06261fd8e01bf430d', '2019-04-17 14:23:54', '2019-04-18 10:46:08', '7hNWib+cXKjBBlQoh+2abQ==', '{\"openId\":\"oKpV75VnDYhfWE-WJYm29d4OklPg\",\"nickName\":\"楠\",\"gender\":2,\"language\":\"zh_CN\",\"city\":\"\",\"province\":\"\",\"country\":\"Andorra\",\"avatarUrl\":\"https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJqUpJd5oqPtOFxvHsXDNJc5z872mvZoPLWPOSlmEMiacONyR6Bv0j9Iw7iaqwT4hubozvFH7picuUuA/132\",\"watermark\":{\"timestamp\":1555482234,\"appid\":\"wxa3ad3b6097ef88a5\"}}');
INSERT INTO `cSessionInfo` VALUES ('oKpV75Wky5Lq6U48-o6de_oUxhtA', '5d9a7044-2796-43ed-ad4c-bdbbc6c83f0f', '828ffff826ff8887e7c2e0c4729eb06e23e131f7', '2019-04-24 00:46:40', '2019-04-24 00:46:42', 'tqRRh4T3k6inAhH8YobsTw==', '{\"openId\":\"oKpV75Wky5Lq6U48-o6de_oUxhtA\",\"nickName\":\"王依婷\",\"gender\":0,\"language\":\"zh_CN\",\"city\":\"\",\"province\":\"\",\"country\":\"\",\"avatarUrl\":\"https://wx.qlogo.cn/mmhead/GSwFtl95CZ1ibB5fQAfY3MPLJLOl0DLjQvPmcReB2yEw/132\",\"watermark\":{\"timestamp\":1556038000,\"appid\":\"wxa3ad3b6097ef88a5\"}}');
INSERT INTO `cSessionInfo` VALUES ('oKpV75Y3tIUwcPa-EqyeGldm03zw', '73581ad2-2e1a-47cf-bd9c-9a724fb77466', '0cc0f40ea0c09cdde86943aa64cb75badcb66c33', '2019-04-18 19:03:34', '2019-04-18 20:23:58', 'Gxg2xZaexaM+EvOXIow3FQ==', '{\"openId\":\"oKpV75Y3tIUwcPa-EqyeGldm03zw\",\"nickName\":\"无情\",\"gender\":2,\"language\":\"zh_CN\",\"city\":\"Handan\",\"province\":\"Hebei\",\"country\":\"China\",\"avatarUrl\":\"https://wx.qlogo.cn/mmopen/vi_32/8cACjzfp0eU3fy4VsfIwLO739lD8nAy9jdia2cXHVvFsOvszQc5mkfJlqJpDk5QEolH9snNa64w6qMqYrf30k9w/132\",\"watermark\":{\"timestamp\":1555585414,\"appid\":\"wxa3ad3b6097ef88a5\"}}');
INSERT INTO `cSessionInfo` VALUES ('oKpV75YRmjfxesJVL-MYefHn94s0', '03b7f0fc-ffe1-41cc-b325-9052ed7b0e59', '6025b398a7fd55ea155e92c5e6c48f44fb9e17e1', '2019-04-16 11:36:38', '2019-05-08 12:32:03', '1ogL3cHZwiuzQDKqk+LrWA==', '{\"openId\":\"oKpV75YRmjfxesJVL-MYefHn94s0\",\"nickName\":\"hot July!\",\"gender\":1,\"language\":\"zh_CN\",\"city\":\"Haidian\",\"province\":\"Beijing\",\"country\":\"China\",\"avatarUrl\":\"https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKTAKspiaW6t3JppoibhtC9noTEa204Ps5ZSibzmWiclxSPb3XjN4DS7nUWQ5h3p76k5HVOK0VENaQp8g/132\",\"watermark\":{\"timestamp\":1555385798,\"appid\":\"wxa3ad3b6097ef88a5\"}}');
INSERT INTO `cSessionInfo` VALUES ('oKpV75YsRCrTTtHy1kx4H0fFguRk', '9369ce8d-1dae-437c-90dd-a42b32c99141', 'd8a5f0305470fe77e347466f1dfa222b28ae80a8', '2019-04-22 00:35:02', '2019-04-22 00:35:24', 'Ay/lupSkcTpkkYqLIweZyw==', '{\"openId\":\"oKpV75YsRCrTTtHy1kx4H0fFguRk\",\"nickName\":\"丁汉臻\",\"gender\":0,\"language\":\"zh_CN\",\"city\":\"\",\"province\":\"\",\"country\":\"\",\"avatarUrl\":\"https://wx.qlogo.cn/mmhead/mkicXlnp9JBX85EjISeLEEfqQZ2mAazibgksMK6L8vhS8/132\",\"watermark\":{\"timestamp\":1555864501,\"appid\":\"wxa3ad3b6097ef88a5\"}}');
INSERT INTO `cSessionInfo` VALUES ('oKpV75YUCKD0d5sYPHanrJRxCxnY', 'b5093236-bf81-4807-b5b6-f855a9ca94ba', 'aa6335e9e6428288fec4a93085574b5326b0d145', '2019-04-16 11:57:05', '2019-04-16 11:58:00', 'AfjyGaFwCTJJ9EcawlJpIA==', '{\"openId\":\"oKpV75YUCKD0d5sYPHanrJRxCxnY\",\"nickName\":\"小卡卡\",\"gender\":2,\"language\":\"zh_CN\",\"city\":\"Guangzhou\",\"province\":\"Guangdong\",\"country\":\"China\",\"avatarUrl\":\"https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLGibMEGMoCCco9ib5JDQIMnk69Ww54e7aSEHMyFw1hmicicAuYmMsIEiaG9efuzRwCd8UiaLdQkUicQmcJg/132\",\"watermark\":{\"timestamp\":1555387024,\"appid\":\"wxa3ad3b6097ef88a5\"}}');
INSERT INTO `cSessionInfo` VALUES ('oKpV75ZI4qXQ5Th0-d22LCsvxPoU', '6a2a93e3-d647-448e-b18c-05d05dc3c081', '232ece16a7689395b93a852e784a8ec14394ec01', '2019-04-19 08:24:27', '2019-04-19 10:40:11', 'aXtJP7AiyysjdxHJikneRA==', '{\"openId\":\"oKpV75ZI4qXQ5Th0-d22LCsvxPoU\",\"nickName\":\"阮建安\",\"gender\":0,\"language\":\"zh_CN\",\"city\":\"\",\"province\":\"\",\"country\":\"\",\"avatarUrl\":\"https://wx.qlogo.cn/mmhead/LYD0Ed3wALBdlc1EH6PmQzYrO4xXRd7pB0QRrwV93BM/132\",\"watermark\":{\"timestamp\":1555633467,\"appid\":\"wxa3ad3b6097ef88a5\"}}');
INSERT INTO `cSessionInfo` VALUES ('oKpV75ZMr5wLCs4subKFuSqkKXK8', 'c7b459d4-4fa3-487c-9a38-18b2d672162f', 'fbcd2bc10dd2464b02700e94d40ab81a18285b19', '2019-04-19 21:52:08', '2019-04-19 21:52:10', 'wlkxKLHDfwStDmMRUz42Rw==', '{\"openId\":\"oKpV75ZMr5wLCs4subKFuSqkKXK8\",\"nickName\":\"夏雅惠\",\"gender\":0,\"language\":\"zh_CN\",\"city\":\"\",\"province\":\"\",\"country\":\"\",\"avatarUrl\":\"https://wx.qlogo.cn/mmhead/hibRrvH3nTUfRn4sLet4pd8wLGGn5MeLWRBHKBBsaf70/132\",\"watermark\":{\"timestamp\":1555681928,\"appid\":\"wxa3ad3b6097ef88a5\"}}');
INSERT INTO `cSessionInfo` VALUES ('oKpV75ZxWxXfKpt_Tl5vY679qzc8', '124399a6-8eeb-47b0-8ac0-ddf5896885f5', 'bfd05e975605e2a3ae144046e87d4ed88a9a18bf', '2019-04-17 10:56:56', '2019-04-17 10:57:42', 'WNdPm9c32JonxXzFCEZg+g==', '{\"openId\":\"oKpV75ZxWxXfKpt_Tl5vY679qzc8\",\"nickName\":\"朱政廷\",\"gender\":0,\"language\":\"zh_CN\",\"city\":\"\",\"province\":\"\",\"country\":\"\",\"avatarUrl\":\"https://wx.qlogo.cn/mmhead/7hoTYqx28VsqScuELgF4FtonokJ4kE9e51xB1f17e9g/132\",\"watermark\":{\"timestamp\":1555469816,\"appid\":\"wxa3ad3b6097ef88a5\"}}');
INSERT INTO `cSessionInfo` VALUES ('oKpV75ZXzw2BYTQ31wMlTamrtTlE', '58ff6068-8374-4749-b876-bddbdaa81f98', '29b504fbf5d713afd2dc0d58a5c77fe5196fbfe9', '2019-04-16 18:10:03', '2019-04-23 12:49:59', '/taQIbbdJyn/zbgkDsdg4g==', '{\"openId\":\"oKpV75ZXzw2BYTQ31wMlTamrtTlE\",\"nickName\":\"Einsning\",\"gender\":1,\"language\":\"zh_CN\",\"city\":\"Handan\",\"province\":\"Hebei\",\"country\":\"China\",\"avatarUrl\":\"https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoA7XmOz8cQ3oxYwFEE4xib9bkdZelH6fN4IZVch8csN2FLwbT6Eyea7gDEnFkHvX194kTCszrt2KQ/132\",\"watermark\":{\"timestamp\":1555409403,\"appid\":\"wxa3ad3b6097ef88a5\"}}');

-- ----------------------------
-- Table structure for zxwx_agent
-- ----------------------------
DROP TABLE IF EXISTS `zxwx_agent`;
CREATE TABLE `zxwx_agent` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `agent_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '代理商名称',
  `province` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '省',
  `city` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '市',
  `county` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '县',
  `status` int(4) NOT NULL DEFAULT '1' COMMENT '状态：1有效；0无效',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '签约时间',
  `service_fee` float(8,2) DEFAULT '0.00' COMMENT '代理费',
  `person` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '负责人',
  `phone` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '负责人手机号码',
  `range` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '代理省市县范围',
  `expire_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '到期时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of zxwx_agent
-- ----------------------------

-- ----------------------------
-- Table structure for zxwx_bind
-- ----------------------------
DROP TABLE IF EXISTS `zxwx_bind`;
CREATE TABLE `zxwx_bind` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `open_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '微信的唯一ID',
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '普通用户表中的ID',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `bind_role_id` int(11) NOT NULL DEFAULT '2' COMMENT '绑定角色表中的id字段',
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '家长手机号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of zxwx_bind
-- ----------------------------
INSERT INTO `zxwx_bind` VALUES ('28', 'oKpV75YRmjfxesJVL-MYefHn94s0', '39', '2019-04-16 18:42:30', '1', '13651185170');
INSERT INTO `zxwx_bind` VALUES ('33', 'oKpV75VnDYhfWE-WJYm29d4OklPg', '47', '2019-04-18 10:45:36', '0', '');
INSERT INTO `zxwx_bind` VALUES ('37', 'oKpV75Y3tIUwcPa-EqyeGldm03zw', '51', '2019-04-18 19:19:07', '0', '');
INSERT INTO `zxwx_bind` VALUES ('39', 'oKpV75avmo2vIwSzPeMdBiXbzatE', '53', '2019-04-18 20:52:11', '0', '');
INSERT INTO `zxwx_bind` VALUES ('43', 'oKpV75V9uBLgbNxeCkEGoN4xze4k', '43', '2019-04-19 08:46:06', '1', '13113133113');
INSERT INTO `zxwx_bind` VALUES ('44', 'oKpV75bfcxbqK1gxekKXaZ5cKmmA', '38', '2019-04-20 19:41:05', '0', '');
INSERT INTO `zxwx_bind` VALUES ('46', 'oKpV75Qn6p826crnKUMpLAWFczNs', '37', '2019-04-20 19:53:49', '0', '');
INSERT INTO `zxwx_bind` VALUES ('47', 'oKpV75ZXzw2BYTQ31wMlTamrtTlE', '84', '2019-04-23 09:02:20', '0', '');
INSERT INTO `zxwx_bind` VALUES ('48', 'oKpV75QlYcK0o6lnwiKwK9tkRyA8', '42', '2019-04-23 09:06:03', '1', '17303201986');

-- ----------------------------
-- Table structure for zxwx_bind_role
-- ----------------------------
DROP TABLE IF EXISTS `zxwx_bind_role`;
CREATE TABLE `zxwx_bind_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of zxwx_bind_role
-- ----------------------------
INSERT INTO `zxwx_bind_role` VALUES ('1', '父亲');
INSERT INTO `zxwx_bind_role` VALUES ('2', '母亲');
INSERT INTO `zxwx_bind_role` VALUES ('3', '外公');
INSERT INTO `zxwx_bind_role` VALUES ('4', '外婆');
INSERT INTO `zxwx_bind_role` VALUES ('5', '爷爷');
INSERT INTO `zxwx_bind_role` VALUES ('6', '奶奶');
INSERT INTO `zxwx_bind_role` VALUES ('7', '其他');

-- ----------------------------
-- Table structure for zxwx_chat
-- ----------------------------
DROP TABLE IF EXISTS `zxwx_chat`;
CREATE TABLE `zxwx_chat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '留言时间',
  `from_open_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '来自谁',
  `to_open_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '发给谁',
  `content` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '留言内容',
  `status` int(2) NOT NULL DEFAULT '0' COMMENT '读取状态：1已读取；0未读取',
  `school_id` int(11) NOT NULL COMMENT '学校ID',
  `class_id` int(11) NOT NULL COMMENT '班级ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of zxwx_chat
-- ----------------------------
INSERT INTO `zxwx_chat` VALUES ('55', '2019-04-16 14:23:13', 'oKpV75V9uBLgbNxeCkEGoN4xze4k', 'oKpV75YRmjfxesJVL-MYefHn94s0', '在吗？', '1', '29', '18');
INSERT INTO `zxwx_chat` VALUES ('56', '2019-04-16 14:23:58', 'oKpV75YRmjfxesJVL-MYefHn94s0', 'oKpV75V9uBLgbNxeCkEGoN4xze4k', '滚', '1', '29', '18');
INSERT INTO `zxwx_chat` VALUES ('57', '2019-04-16 18:43:59', 'oKpV75SJbrO-z4GmIutdoMDS2mL8', 'oKpV75V9uBLgbNxeCkEGoN4xze4k', '吃屎', '1', '29', '18');
INSERT INTO `zxwx_chat` VALUES ('58', '2019-04-16 18:45:01', 'oKpV75V9uBLgbNxeCkEGoN4xze4k', 'oKpV75SJbrO-z4GmIutdoMDS2mL8', '你自己吃吧', '1', '29', '18');
INSERT INTO `zxwx_chat` VALUES ('59', '2019-04-17 10:37:41', 'oKpV75SJbrO-z4GmIutdoMDS2mL8', 'oKpV75V9uBLgbNxeCkEGoN4xze4k', '你好', '1', '29', '18');
INSERT INTO `zxwx_chat` VALUES ('60', '2019-04-17 10:38:00', 'oKpV75SJbrO-z4GmIutdoMDS2mL8', 'oKpV75V9uBLgbNxeCkEGoN4xze4k', '在吗', '1', '29', '18');
INSERT INTO `zxwx_chat` VALUES ('61', '2019-04-17 10:38:30', 'oKpV75V9uBLgbNxeCkEGoN4xze4k', 'oKpV75SJbrO-z4GmIutdoMDS2mL8', '嗯，怎么了？', '1', '29', '18');
INSERT INTO `zxwx_chat` VALUES ('62', '2019-04-17 10:38:43', 'oKpV75SJbrO-z4GmIutdoMDS2mL8', 'oKpV75V9uBLgbNxeCkEGoN4xze4k', '吃药了吗', '1', '29', '18');
INSERT INTO `zxwx_chat` VALUES ('63', '2019-04-17 10:39:01', 'oKpV75SJbrO-z4GmIutdoMDS2mL8', 'oKpV75V9uBLgbNxeCkEGoN4xze4k', '你的孩子', '1', '29', '18');
INSERT INTO `zxwx_chat` VALUES ('64', '2019-04-17 10:39:13', 'oKpV75V9uBLgbNxeCkEGoN4xze4k', 'oKpV75SJbrO-z4GmIutdoMDS2mL8', '？', '1', '29', '18');
INSERT INTO `zxwx_chat` VALUES ('65', '2019-04-17 10:39:24', 'oKpV75SJbrO-z4GmIutdoMDS2mL8', 'oKpV75V9uBLgbNxeCkEGoN4xze4k', '嗯哼', '1', '29', '18');
INSERT INTO `zxwx_chat` VALUES ('66', '2019-04-17 10:39:43', 'oKpV75SJbrO-z4GmIutdoMDS2mL8', 'oKpV75V9uBLgbNxeCkEGoN4xze4k', '好的', '1', '29', '18');
INSERT INTO `zxwx_chat` VALUES ('67', '2019-04-17 10:39:57', 'oKpV75V9uBLgbNxeCkEGoN4xze4k', 'oKpV75SJbrO-z4GmIutdoMDS2mL8', '？？', '1', '29', '18');
INSERT INTO `zxwx_chat` VALUES ('68', '2019-04-17 10:41:02', 'oKpV75SJbrO-z4GmIutdoMDS2mL8', 'oKpV75V9uBLgbNxeCkEGoN4xze4k', '不会光', '1', '29', '18');
INSERT INTO `zxwx_chat` VALUES ('69', '2019-04-17 10:41:06', 'oKpV75V9uBLgbNxeCkEGoN4xze4k', 'oKpV75SJbrO-z4GmIutdoMDS2mL8', '？', '1', '29', '18');
INSERT INTO `zxwx_chat` VALUES ('70', '2019-04-17 10:41:12', 'oKpV75SJbrO-z4GmIutdoMDS2mL8', 'oKpV75V9uBLgbNxeCkEGoN4xze4k', '我们的', '1', '29', '18');
INSERT INTO `zxwx_chat` VALUES ('71', '2019-04-17 10:41:21', 'oKpV75SJbrO-z4GmIutdoMDS2mL8', 'oKpV75V9uBLgbNxeCkEGoN4xze4k', '在一起', '1', '29', '18');
INSERT INTO `zxwx_chat` VALUES ('72', '2019-04-17 10:41:29', 'oKpV75SJbrO-z4GmIutdoMDS2mL8', 'oKpV75V9uBLgbNxeCkEGoN4xze4k', '那样都', '1', '29', '18');
INSERT INTO `zxwx_chat` VALUES ('73', '2019-04-17 10:47:39', 'oKpV75YRmjfxesJVL-MYefHn94s0', 'oKpV75SJbrO-z4GmIutdoMDS2mL8', '？', '1', '29', '18');
INSERT INTO `zxwx_chat` VALUES ('74', '2019-04-17 12:59:28', 'oKpV75SJbrO-z4GmIutdoMDS2mL8', 'oKpV75YRmjfxesJVL-MYefHn94s0', '？', '1', '29', '18');
INSERT INTO `zxwx_chat` VALUES ('75', '2019-04-18 19:29:36', 'oKpV75V9uBLgbNxeCkEGoN4xze4k', 'oKpV75Y3tIUwcPa-EqyeGldm03zw', '在吗老师', '1', '29', '21');
INSERT INTO `zxwx_chat` VALUES ('76', '2019-04-18 19:31:25', 'oKpV75V9uBLgbNxeCkEGoN4xze4k', 'oKpV75Y3tIUwcPa-EqyeGldm03zw', '关注了？', '1', '29', '21');
INSERT INTO `zxwx_chat` VALUES ('77', '2019-04-18 19:32:00', 'oKpV75V9uBLgbNxeCkEGoN4xze4k', 'oKpV75Y3tIUwcPa-EqyeGldm03zw', '能收到信息不', '1', '29', '21');
INSERT INTO `zxwx_chat` VALUES ('78', '2019-04-18 19:32:44', 'oKpV75Y3tIUwcPa-EqyeGldm03zw', 'oKpV75V9uBLgbNxeCkEGoN4xze4k', '在', '1', '29', '21');
INSERT INTO `zxwx_chat` VALUES ('79', '2019-04-18 19:32:57', 'oKpV75Y3tIUwcPa-EqyeGldm03zw', 'oKpV75V9uBLgbNxeCkEGoN4xze4k', '能看到吗', '1', '29', '21');
INSERT INTO `zxwx_chat` VALUES ('80', '2019-04-18 19:33:04', 'oKpV75V9uBLgbNxeCkEGoN4xze4k', 'oKpV75Y3tIUwcPa-EqyeGldm03zw', '这个算不算', '1', '29', '21');
INSERT INTO `zxwx_chat` VALUES ('81', '2019-04-18 19:33:13', 'oKpV75V9uBLgbNxeCkEGoN4xze4k', 'oKpV75Y3tIUwcPa-EqyeGldm03zw', '是你说的通讯录吗', '1', '29', '21');
INSERT INTO `zxwx_chat` VALUES ('82', '2019-04-18 19:33:16', 'oKpV75Y3tIUwcPa-EqyeGldm03zw', 'oKpV75V9uBLgbNxeCkEGoN4xze4k', '可以', '1', '29', '21');
INSERT INTO `zxwx_chat` VALUES ('83', '2019-04-18 19:33:18', 'oKpV75V9uBLgbNxeCkEGoN4xze4k', 'oKpV75Y3tIUwcPa-EqyeGldm03zw', '是你说的通讯录吗', '1', '29', '21');
INSERT INTO `zxwx_chat` VALUES ('84', '2019-04-18 20:57:03', 'oKpV75SJbrO-z4GmIutdoMDS2mL8', 'oKpV75avmo2vIwSzPeMdBiXbzatE', '在吗', '1', '31', '22');
INSERT INTO `zxwx_chat` VALUES ('85', '2019-04-18 20:57:41', 'oKpV75avmo2vIwSzPeMdBiXbzatE', 'oKpV75SJbrO-z4GmIutdoMDS2mL8', '嗯', '1', '31', '22');
INSERT INTO `zxwx_chat` VALUES ('86', '2019-04-18 20:57:48', 'oKpV75avmo2vIwSzPeMdBiXbzatE', 'oKpV75SJbrO-z4GmIutdoMDS2mL8', '嗯', '1', '31', '22');
INSERT INTO `zxwx_chat` VALUES ('87', '2019-04-18 20:58:02', 'oKpV75avmo2vIwSzPeMdBiXbzatE', 'oKpV75SJbrO-z4GmIutdoMDS2mL8', '这是要干啥', '1', '31', '22');
INSERT INTO `zxwx_chat` VALUES ('88', '2019-04-18 20:58:21', 'oKpV75SJbrO-z4GmIutdoMDS2mL8', 'oKpV75avmo2vIwSzPeMdBiXbzatE', '这个里边是发作业的', '1', '31', '22');
INSERT INTO `zxwx_chat` VALUES ('89', '2019-04-18 20:58:49', 'oKpV75SJbrO-z4GmIutdoMDS2mL8', 'oKpV75avmo2vIwSzPeMdBiXbzatE', '你可以点击那个作业，然后发一张图', '1', '31', '22');
INSERT INTO `zxwx_chat` VALUES ('90', '2019-04-18 20:59:53', 'oKpV75SJbrO-z4GmIutdoMDS2mL8', 'oKpV75avmo2vIwSzPeMdBiXbzatE', '错了，是在那个发布那', '1', '31', '22');
INSERT INTO `zxwx_chat` VALUES ('91', '2019-04-18 21:00:01', 'oKpV75SJbrO-z4GmIutdoMDS2mL8', 'oKpV75avmo2vIwSzPeMdBiXbzatE', '点开那个发布', '1', '31', '22');

-- ----------------------------
-- Table structure for zxwx_class
-- ----------------------------
DROP TABLE IF EXISTS `zxwx_class`;
CREATE TABLE `zxwx_class` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `class_name` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '班级名称',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `admin_id` int(11) DEFAULT NULL COMMENT '班主任ID-普通用户表中的id字段',
  `grade_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '年级名称',
  `school_id` int(11) NOT NULL COMMENT '学校表中的id字段',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of zxwx_class
-- ----------------------------
INSERT INTO `zxwx_class` VALUES ('18', '一班', '2019-04-16 10:52:24', '37', '一年级', '29');
INSERT INTO `zxwx_class` VALUES ('19', '二班', '2019-04-16 10:52:44', null, '一年级', '29');
INSERT INTO `zxwx_class` VALUES ('20', '二班', '2019-04-17 15:01:36', '47', '中班', '30');
INSERT INTO `zxwx_class` VALUES ('21', '三班', '2019-04-18 18:55:23', '51', '一年级', '29');
INSERT INTO `zxwx_class` VALUES ('22', '一班', '2019-04-18 20:44:59', '53', '中班', '31');
INSERT INTO `zxwx_class` VALUES ('23', '一班', '2019-04-19 09:34:49', null, '二年级', '29');

-- ----------------------------
-- Table structure for zxwx_img
-- ----------------------------
DROP TABLE IF EXISTS `zxwx_img`;
CREATE TABLE `zxwx_img` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `src_path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '图片服务器相对路径',
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'javascript:' COMMENT '点击跳转页面',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of zxwx_img
-- ----------------------------
INSERT INTO `zxwx_img` VALUES ('27', '0e6f08b3-6ee8-43ed-87fb-eeee05a383c0.jpg', 'javascript:');
INSERT INTO `zxwx_img` VALUES ('29', '2b48094d-cfe2-49fa-86c7-9547d899bba5.jpg', 'javascript:');
INSERT INTO `zxwx_img` VALUES ('30', 'b1c8a0b3-fa57-414d-beec-657caf5276d9.jpg', null);

-- ----------------------------
-- Table structure for zxwx_job_content
-- ----------------------------
DROP TABLE IF EXISTS `zxwx_job_content`;
CREATE TABLE `zxwx_job_content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_id` int(11) NOT NULL COMMENT '作业表ID',
  `type` int(2) NOT NULL COMMENT '内容类型：1文本内容；2语音内容；3图片内容；4视频内容',
  `content` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '具体作业内容',
  `duration` int(20) DEFAULT '0' COMMENT '语音时长，单位：秒',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of zxwx_job_content
-- ----------------------------
INSERT INTO `zxwx_job_content` VALUES ('36', '36', '1', '课本第二页写一遍', '0');
INSERT INTO `zxwx_job_content` VALUES ('37', '36', '3', 'http://www.cxyd.ltd/cxyd_static/tIMq5BjoFV3LQmNjvSYZQq3s.jpg', '0');
INSERT INTO `zxwx_job_content` VALUES ('38', '37', '3', 'http://www.cxyd.ltd/cxyd_static/ykfzgpg9osix8h8a07UlzvNr.jpg', '0');
INSERT INTO `zxwx_job_content` VALUES ('39', '38', '3', 'http://www.cxyd.ltd/cxyd_static/sz3XK98IU7wOSka9igv4HB_U.jpg', '0');
INSERT INTO `zxwx_job_content` VALUES ('40', '39', '3', 'http://www.cxyd.ltd/cxyd_static/TKjcjDF4lF5clSdDXSnuyRhq.jpg', '0');
INSERT INTO `zxwx_job_content` VALUES ('41', '40', '3', 'http://www.cxyd.ltd/cxyd_static/TKjcjDF4lF5clSdDXSnuyRhq.jpg', '0');
INSERT INTO `zxwx_job_content` VALUES ('42', '41', '3', 'http://www.cxyd.ltd/cxyd_static/wqIf1Er5tr5bAETvMjhFbqua.jpg', '0');
INSERT INTO `zxwx_job_content` VALUES ('43', '42', '3', 'http://www.cxyd.ltd/cxyd_static/xk0j0fiblfDH1iNiCykaVY8K.jpg', '0');
INSERT INTO `zxwx_job_content` VALUES ('44', '43', '1', '1', '0');
INSERT INTO `zxwx_job_content` VALUES ('45', '44', '3', 'http://www.cxyd.ltd/cxyd_static/yFzkxj3oKbzfHWWY0IhbOtdk.jpg', '0');
INSERT INTO `zxwx_job_content` VALUES ('46', '45', '1', '1', '0');
INSERT INTO `zxwx_job_content` VALUES ('47', '46', '4', 'http://www.cxyd.ltd/cxyd_static/kFNEaIyOnrPM7KljGnn8nF0G.mp4', '0');
INSERT INTO `zxwx_job_content` VALUES ('48', '47', '1', '数学作业是课时笔记15页填完判签', '0');
INSERT INTO `zxwx_job_content` VALUES ('49', '48', '1', '霍营', '0');
INSERT INTO `zxwx_job_content` VALUES ('50', '49', '1', '11', '0');
INSERT INTO `zxwx_job_content` VALUES ('51', '50', '1', '秘籍咯咯咯精灵梦民工民工你莫OP明末公民', '0');
INSERT INTO `zxwx_job_content` VALUES ('52', '51', '1', '课堂练习十五页', '0');

-- ----------------------------
-- Table structure for zxwx_job_user_map
-- ----------------------------
DROP TABLE IF EXISTS `zxwx_job_user_map`;
CREATE TABLE `zxwx_job_user_map` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_id` int(11) NOT NULL COMMENT '作业表ID',
  `to_user_id` int(11) NOT NULL COMMENT '作业接收人普通用户ID',
  `read_state` int(2) NOT NULL DEFAULT '0' COMMENT '当前状态：0未读；1已读',
  `submit_state` int(2) NOT NULL DEFAULT '0' COMMENT '当前状态：0未交；1已交',
  `read_time` timestamp NULL DEFAULT NULL COMMENT '作业读取时间',
  `submit_time` timestamp NULL DEFAULT NULL COMMENT '作业提交时间',
  `reply` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '老师回复内容，以逗号分割，可能有图片路径，功能做时要考虑好',
  `star` int(2) DEFAULT '5' COMMENT '星星数',
  `reply_state` int(2) DEFAULT '0' COMMENT '批阅状态：0未批；1已批',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=175 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of zxwx_job_user_map
-- ----------------------------
INSERT INTO `zxwx_job_user_map` VALUES ('67', '36', '39', '0', '0', null, null, '', '5', '0');
INSERT INTO `zxwx_job_user_map` VALUES ('68', '36', '40', '0', '0', null, null, '', '5', '0');
INSERT INTO `zxwx_job_user_map` VALUES ('69', '36', '43', '0', '0', null, null, '', '5', '0');
INSERT INTO `zxwx_job_user_map` VALUES ('70', '36', '44', '0', '0', null, null, '', '5', '0');
INSERT INTO `zxwx_job_user_map` VALUES ('71', '36', '45', '0', '0', null, null, '', '5', '0');
INSERT INTO `zxwx_job_user_map` VALUES ('72', '37', '41', '0', '0', null, null, '', '5', '0');
INSERT INTO `zxwx_job_user_map` VALUES ('73', '37', '42', '0', '0', null, null, '', '5', '0');
INSERT INTO `zxwx_job_user_map` VALUES ('74', '37', '39', '0', '0', null, null, '', '5', '0');
INSERT INTO `zxwx_job_user_map` VALUES ('75', '37', '40', '0', '0', null, null, '', '5', '0');
INSERT INTO `zxwx_job_user_map` VALUES ('76', '37', '43', '0', '0', null, null, '', '5', '0');
INSERT INTO `zxwx_job_user_map` VALUES ('77', '37', '44', '0', '0', null, null, '', '5', '0');
INSERT INTO `zxwx_job_user_map` VALUES ('78', '37', '45', '0', '0', null, null, '', '5', '0');
INSERT INTO `zxwx_job_user_map` VALUES ('79', '38', '41', '0', '0', null, null, '', '5', '0');
INSERT INTO `zxwx_job_user_map` VALUES ('80', '38', '42', '0', '0', null, null, '', '5', '0');
INSERT INTO `zxwx_job_user_map` VALUES ('81', '38', '39', '0', '0', null, null, '', '5', '0');
INSERT INTO `zxwx_job_user_map` VALUES ('82', '38', '40', '0', '0', null, null, '', '5', '0');
INSERT INTO `zxwx_job_user_map` VALUES ('83', '38', '43', '0', '0', null, null, '', '5', '0');
INSERT INTO `zxwx_job_user_map` VALUES ('84', '38', '44', '0', '0', null, null, '', '5', '0');
INSERT INTO `zxwx_job_user_map` VALUES ('85', '38', '45', '0', '0', null, null, '', '5', '0');
INSERT INTO `zxwx_job_user_map` VALUES ('86', '39', '41', '0', '0', null, null, '', '5', '0');
INSERT INTO `zxwx_job_user_map` VALUES ('87', '39', '42', '0', '0', null, null, '', '5', '0');
INSERT INTO `zxwx_job_user_map` VALUES ('88', '39', '39', '0', '0', null, null, '', '5', '0');
INSERT INTO `zxwx_job_user_map` VALUES ('89', '39', '40', '0', '0', null, null, '', '5', '0');
INSERT INTO `zxwx_job_user_map` VALUES ('90', '39', '43', '0', '0', null, null, '', '5', '0');
INSERT INTO `zxwx_job_user_map` VALUES ('91', '39', '44', '0', '0', null, null, '', '5', '0');
INSERT INTO `zxwx_job_user_map` VALUES ('92', '39', '45', '0', '0', null, null, '', '5', '0');
INSERT INTO `zxwx_job_user_map` VALUES ('93', '40', '41', '0', '0', null, null, '', '5', '0');
INSERT INTO `zxwx_job_user_map` VALUES ('94', '40', '42', '0', '0', null, null, '', '5', '0');
INSERT INTO `zxwx_job_user_map` VALUES ('95', '40', '39', '0', '0', null, null, '', '5', '0');
INSERT INTO `zxwx_job_user_map` VALUES ('96', '40', '40', '0', '0', null, null, '', '5', '0');
INSERT INTO `zxwx_job_user_map` VALUES ('97', '40', '43', '0', '0', null, null, '', '5', '0');
INSERT INTO `zxwx_job_user_map` VALUES ('98', '40', '44', '0', '0', null, null, '', '5', '0');
INSERT INTO `zxwx_job_user_map` VALUES ('99', '40', '45', '0', '0', null, null, '', '5', '0');
INSERT INTO `zxwx_job_user_map` VALUES ('100', '41', '41', '0', '0', null, null, '', '5', '0');
INSERT INTO `zxwx_job_user_map` VALUES ('101', '41', '42', '0', '0', null, null, '', '5', '0');
INSERT INTO `zxwx_job_user_map` VALUES ('102', '41', '39', '0', '0', null, null, '', '5', '0');
INSERT INTO `zxwx_job_user_map` VALUES ('103', '41', '40', '0', '0', null, null, '', '5', '0');
INSERT INTO `zxwx_job_user_map` VALUES ('104', '41', '43', '0', '0', null, null, '', '5', '0');
INSERT INTO `zxwx_job_user_map` VALUES ('105', '41', '44', '0', '0', null, null, '', '5', '0');
INSERT INTO `zxwx_job_user_map` VALUES ('106', '41', '45', '0', '0', null, null, '', '5', '0');
INSERT INTO `zxwx_job_user_map` VALUES ('107', '42', '41', '0', '0', null, null, '', '5', '0');
INSERT INTO `zxwx_job_user_map` VALUES ('108', '42', '42', '0', '0', null, null, '', '5', '0');
INSERT INTO `zxwx_job_user_map` VALUES ('109', '42', '39', '0', '0', null, null, '', '5', '0');
INSERT INTO `zxwx_job_user_map` VALUES ('110', '42', '40', '0', '0', null, null, '', '5', '0');
INSERT INTO `zxwx_job_user_map` VALUES ('111', '42', '43', '0', '1', null, '2019-04-16 18:47:14', '非常棒', '5', '1');
INSERT INTO `zxwx_job_user_map` VALUES ('112', '42', '44', '0', '0', null, null, '', '5', '0');
INSERT INTO `zxwx_job_user_map` VALUES ('113', '42', '45', '0', '0', null, null, '', '5', '0');
INSERT INTO `zxwx_job_user_map` VALUES ('114', '43', '39', '0', '0', null, null, '', '5', '0');
INSERT INTO `zxwx_job_user_map` VALUES ('115', '43', '40', '0', '0', null, null, '', '5', '0');
INSERT INTO `zxwx_job_user_map` VALUES ('116', '43', '43', '0', '0', null, null, '', '5', '0');
INSERT INTO `zxwx_job_user_map` VALUES ('117', '43', '44', '0', '0', null, null, '', '5', '0');
INSERT INTO `zxwx_job_user_map` VALUES ('118', '43', '45', '0', '0', null, null, '', '5', '0');
INSERT INTO `zxwx_job_user_map` VALUES ('119', '44', '41', '0', '0', null, null, '', '5', '0');
INSERT INTO `zxwx_job_user_map` VALUES ('120', '44', '42', '0', '0', null, null, '', '5', '0');
INSERT INTO `zxwx_job_user_map` VALUES ('121', '44', '39', '0', '1', null, '2019-04-17 10:46:52', '非常棒', '5', '1');
INSERT INTO `zxwx_job_user_map` VALUES ('122', '44', '40', '0', '0', null, null, '', '5', '0');
INSERT INTO `zxwx_job_user_map` VALUES ('123', '44', '43', '0', '1', null, '2019-04-17 10:32:19', '非常棒', '2', '1');
INSERT INTO `zxwx_job_user_map` VALUES ('124', '44', '44', '0', '0', null, null, '', '5', '0');
INSERT INTO `zxwx_job_user_map` VALUES ('125', '44', '45', '0', '0', null, null, '', '5', '0');
INSERT INTO `zxwx_job_user_map` VALUES ('126', '45', '39', '0', '0', null, null, '', '5', '0');
INSERT INTO `zxwx_job_user_map` VALUES ('127', '45', '40', '0', '0', null, null, '', '5', '0');
INSERT INTO `zxwx_job_user_map` VALUES ('128', '45', '43', '0', '1', null, '2019-04-17 11:21:16', '非常棒', '5', '1');
INSERT INTO `zxwx_job_user_map` VALUES ('129', '45', '44', '0', '0', null, null, '', '5', '0');
INSERT INTO `zxwx_job_user_map` VALUES ('130', '45', '45', '0', '0', null, null, '', '5', '0');
INSERT INTO `zxwx_job_user_map` VALUES ('131', '46', '39', '0', '0', null, null, '', '5', '0');
INSERT INTO `zxwx_job_user_map` VALUES ('132', '46', '40', '0', '0', null, null, '', '5', '0');
INSERT INTO `zxwx_job_user_map` VALUES ('133', '46', '43', '0', '0', null, null, '', '5', '0');
INSERT INTO `zxwx_job_user_map` VALUES ('134', '46', '44', '0', '0', null, null, '', '5', '0');
INSERT INTO `zxwx_job_user_map` VALUES ('135', '46', '45', '0', '0', null, null, '', '5', '0');
INSERT INTO `zxwx_job_user_map` VALUES ('136', '47', '52', '0', '1', null, '2019-04-18 19:49:00', '非常棒', '5', '1');
INSERT INTO `zxwx_job_user_map` VALUES ('137', '48', '39', '0', '0', null, null, '', '5', '0');
INSERT INTO `zxwx_job_user_map` VALUES ('138', '48', '40', '0', '0', null, null, '', '5', '0');
INSERT INTO `zxwx_job_user_map` VALUES ('139', '48', '43', '0', '0', null, null, '', '5', '0');
INSERT INTO `zxwx_job_user_map` VALUES ('140', '48', '44', '0', '0', null, null, '', '5', '0');
INSERT INTO `zxwx_job_user_map` VALUES ('141', '48', '45', '0', '0', null, null, '', '5', '0');
INSERT INTO `zxwx_job_user_map` VALUES ('142', '49', '39', '0', '0', null, null, '', '5', '0');
INSERT INTO `zxwx_job_user_map` VALUES ('143', '49', '40', '0', '0', null, null, '', '5', '0');
INSERT INTO `zxwx_job_user_map` VALUES ('144', '49', '43', '0', '0', null, null, '', '5', '0');
INSERT INTO `zxwx_job_user_map` VALUES ('145', '49', '44', '0', '0', null, null, '', '5', '0');
INSERT INTO `zxwx_job_user_map` VALUES ('146', '49', '45', '0', '0', null, null, '', '5', '0');
INSERT INTO `zxwx_job_user_map` VALUES ('147', '50', '39', '0', '0', null, null, '', '5', '0');
INSERT INTO `zxwx_job_user_map` VALUES ('148', '50', '40', '0', '0', null, null, '', '5', '0');
INSERT INTO `zxwx_job_user_map` VALUES ('149', '50', '43', '0', '0', null, null, '', '5', '0');
INSERT INTO `zxwx_job_user_map` VALUES ('150', '50', '44', '0', '0', null, null, '', '5', '0');
INSERT INTO `zxwx_job_user_map` VALUES ('151', '50', '45', '0', '0', null, null, '', '5', '0');
INSERT INTO `zxwx_job_user_map` VALUES ('152', '50', '75', '0', '0', null, null, '', '5', '0');
INSERT INTO `zxwx_job_user_map` VALUES ('153', '50', '76', '0', '0', null, null, '', '5', '0');
INSERT INTO `zxwx_job_user_map` VALUES ('154', '50', '77', '0', '0', null, null, '', '5', '0');
INSERT INTO `zxwx_job_user_map` VALUES ('155', '50', '78', '0', '0', null, null, '', '5', '0');
INSERT INTO `zxwx_job_user_map` VALUES ('156', '50', '79', '0', '0', null, null, '', '5', '0');
INSERT INTO `zxwx_job_user_map` VALUES ('157', '50', '80', '0', '0', null, null, '', '5', '0');
INSERT INTO `zxwx_job_user_map` VALUES ('158', '50', '81', '0', '0', null, null, '', '5', '0');
INSERT INTO `zxwx_job_user_map` VALUES ('159', '50', '82', '0', '0', null, null, '', '5', '0');
INSERT INTO `zxwx_job_user_map` VALUES ('160', '50', '83', '0', '0', null, null, '', '5', '0');
INSERT INTO `zxwx_job_user_map` VALUES ('161', '51', '39', '0', '0', null, null, '', '5', '0');
INSERT INTO `zxwx_job_user_map` VALUES ('162', '51', '40', '0', '0', null, null, '', '5', '0');
INSERT INTO `zxwx_job_user_map` VALUES ('163', '51', '43', '0', '0', null, null, '', '5', '0');
INSERT INTO `zxwx_job_user_map` VALUES ('164', '51', '44', '0', '0', null, null, '', '5', '0');
INSERT INTO `zxwx_job_user_map` VALUES ('165', '51', '45', '0', '0', null, null, '', '5', '0');
INSERT INTO `zxwx_job_user_map` VALUES ('166', '51', '75', '0', '0', null, null, '', '5', '0');
INSERT INTO `zxwx_job_user_map` VALUES ('167', '51', '76', '0', '0', null, null, '', '5', '0');
INSERT INTO `zxwx_job_user_map` VALUES ('168', '51', '77', '0', '0', null, null, '', '5', '0');
INSERT INTO `zxwx_job_user_map` VALUES ('169', '51', '78', '0', '0', null, null, '', '5', '0');
INSERT INTO `zxwx_job_user_map` VALUES ('170', '51', '79', '0', '0', null, null, '', '5', '0');
INSERT INTO `zxwx_job_user_map` VALUES ('171', '51', '80', '0', '0', null, null, '', '5', '0');
INSERT INTO `zxwx_job_user_map` VALUES ('172', '51', '81', '0', '0', null, null, '', '5', '0');
INSERT INTO `zxwx_job_user_map` VALUES ('173', '51', '82', '0', '0', null, null, '', '5', '0');
INSERT INTO `zxwx_job_user_map` VALUES ('174', '51', '83', '0', '0', null, null, '', '5', '0');

-- ----------------------------
-- Table structure for zxwx_notice_user_map
-- ----------------------------
DROP TABLE IF EXISTS `zxwx_notice_user_map`;
CREATE TABLE `zxwx_notice_user_map` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `notice_id` int(11) NOT NULL COMMENT '通知表ID',
  `to_user_id` int(11) NOT NULL COMMENT '通知接收人普通用户ID',
  `state` int(2) NOT NULL DEFAULT '0' COMMENT '当前状态：0未读；1已读',
  `read_time` timestamp NULL DEFAULT NULL COMMENT '通知读取时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of zxwx_notice_user_map
-- ----------------------------
INSERT INTO `zxwx_notice_user_map` VALUES ('9', '7', '39', '0', null);
INSERT INTO `zxwx_notice_user_map` VALUES ('10', '7', '40', '0', null);
INSERT INTO `zxwx_notice_user_map` VALUES ('11', '7', '43', '1', '2019-04-17 11:14:37');
INSERT INTO `zxwx_notice_user_map` VALUES ('12', '7', '44', '0', null);
INSERT INTO `zxwx_notice_user_map` VALUES ('13', '7', '45', '0', null);
INSERT INTO `zxwx_notice_user_map` VALUES ('14', '8', '39', '0', null);
INSERT INTO `zxwx_notice_user_map` VALUES ('15', '8', '40', '0', null);
INSERT INTO `zxwx_notice_user_map` VALUES ('16', '8', '43', '1', '2019-04-17 11:14:30');
INSERT INTO `zxwx_notice_user_map` VALUES ('17', '8', '44', '0', null);
INSERT INTO `zxwx_notice_user_map` VALUES ('18', '8', '45', '0', null);
INSERT INTO `zxwx_notice_user_map` VALUES ('19', '9', '52', '1', '2019-04-18 20:13:55');

-- ----------------------------
-- Table structure for zxwx_school
-- ----------------------------
DROP TABLE IF EXISTS `zxwx_school`;
CREATE TABLE `zxwx_school` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `school_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '学校名称',
  `province` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '省',
  `city` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '市',
  `county` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '县',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `status` int(4) NOT NULL DEFAULT '1' COMMENT '状态：1有效；0无效',
  `agent_id` int(11) DEFAULT NULL COMMENT '代理商表中的id字段',
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '学校详细地址',
  `charge_money` int(11) DEFAULT '5000' COMMENT '学校收费金额（单位：分）',
  `charge` int(2) NOT NULL DEFAULT '0' COMMENT '是否收费，1收费，0不收费',
  `expire_time` timestamp NULL DEFAULT NULL COMMENT '收费到期时间',
  `bind_pwd` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '绑定密码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of zxwx_school
-- ----------------------------
INSERT INTO `zxwx_school` VALUES ('29', '源点小学', '河北省', '邯郸市', '磁县', '2019-04-16 10:50:33', '1', null, '河北省邯郸市磁县西固义村', null, '0', null, '123465');
INSERT INTO `zxwx_school` VALUES ('30', '华夏国学幼儿园', '河北省', '邯郸市', '磁县', '2019-04-17 15:00:07', '1', null, '河北省邯郸市磁县建设路路南', null, '0', null, '123456');
INSERT INTO `zxwx_school` VALUES ('31', '阳光幼儿园', '河北省', '邯郸市', '磁县', '2019-04-18 20:44:24', '1', null, '河北省邯郸市磁县朝阳路南头实验学校附近', null, '0', null, '123465');

-- ----------------------------
-- Table structure for zxwx_school_charge
-- ----------------------------
DROP TABLE IF EXISTS `zxwx_school_charge`;
CREATE TABLE `zxwx_school_charge` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `charge_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '收费名称',
  `total_fee` int(11) NOT NULL DEFAULT '0' COMMENT '收费金额(单位：分)',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `school_id` int(11) NOT NULL COMMENT '学校ID',
  `class_id` int(11) NOT NULL COMMENT '班级ID',
  `user_id` int(11) NOT NULL COMMENT '发布者ID',
  `user_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '发布者名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of zxwx_school_charge
-- ----------------------------
INSERT INTO `zxwx_school_charge` VALUES ('3', '书费', '2000', '2019-04-16 18:50:58', '29', '19', '37', '李静');
INSERT INTO `zxwx_school_charge` VALUES ('4', '书费', '2000', '2019-04-16 18:50:58', '29', '18', '37', '李静');
INSERT INTO `zxwx_school_charge` VALUES ('5', '本费1元', '100', '2019-04-18 20:13:08', '29', '21', '51', '杨英');
INSERT INTO `zxwx_school_charge` VALUES ('6', '111', '100', '2019-04-19 09:48:04', '29', '18', '38', '杨涛');

-- ----------------------------
-- Table structure for zxwx_school_job
-- ----------------------------
DROP TABLE IF EXISTS `zxwx_school_job`;
CREATE TABLE `zxwx_school_job` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `school_id` int(11) NOT NULL COMMENT '学校ID',
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '新作业' COMMENT '作业标题',
  `job_range` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '发布范围',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_id` int(11) NOT NULL COMMENT '发布人ID',
  `user_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '发布人',
  `subject_range` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '科目',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of zxwx_school_job
-- ----------------------------
INSERT INTO `zxwx_school_job` VALUES ('36', '29', '今日作业', '一班', '2019-04-16 14:25:15', '38', '杨涛', '数学');
INSERT INTO `zxwx_school_job` VALUES ('37', '29', '今日作业', '二班,一班', '2019-04-16 18:40:26', '37', '李静', '语文');
INSERT INTO `zxwx_school_job` VALUES ('38', '29', '今日作业', '二班,一班', '2019-04-16 18:40:26', '37', '李静', '语文');
INSERT INTO `zxwx_school_job` VALUES ('39', '29', '今日作业', '二班,一班', '2019-04-16 18:43:41', '37', '李静', '语文');
INSERT INTO `zxwx_school_job` VALUES ('40', '29', '今日作业', '二班,一班', '2019-04-16 18:43:41', '37', '李静', '语文');
INSERT INTO `zxwx_school_job` VALUES ('41', '29', '今日作业', '二班,一班', '2019-04-16 18:43:42', '37', '李静', '语文');
INSERT INTO `zxwx_school_job` VALUES ('42', '29', '今日作业', '二班,一班', '2019-04-16 18:46:32', '37', '李静', '语文');
INSERT INTO `zxwx_school_job` VALUES ('43', '29', '今日作业', '一班', '2019-04-17 09:22:54', '38', '杨涛', '数学');
INSERT INTO `zxwx_school_job` VALUES ('44', '29', '今日作业', '二班,一班', '2019-04-17 10:31:31', '37', '李静', '语文');
INSERT INTO `zxwx_school_job` VALUES ('45', '29', '今日作业2', '一班', '2019-04-17 11:20:35', '38', '杨涛', '数学');
INSERT INTO `zxwx_school_job` VALUES ('46', '29', '今日作业', '一班', '2019-04-18 17:57:49', '38', '杨涛', '数学');
INSERT INTO `zxwx_school_job` VALUES ('47', '29', '今日作业', '三班', '2019-04-18 19:47:03', '51', '杨英', '数学');
INSERT INTO `zxwx_school_job` VALUES ('48', '29', '今日作业', '一班', '2019-04-18 19:54:38', '38', '杨涛', '数学');
INSERT INTO `zxwx_school_job` VALUES ('49', '29', '今日作业', '一班', '2019-04-19 09:36:19', '38', '杨涛', '数学');
INSERT INTO `zxwx_school_job` VALUES ('50', '29', '今日作业', '一班', '2019-04-20 19:46:47', '37', '李静', '语文');
INSERT INTO `zxwx_school_job` VALUES ('51', '29', '今日作业', '一班', '2019-04-20 19:56:40', '38', '杨涛', '数学');

-- ----------------------------
-- Table structure for zxwx_school_leave
-- ----------------------------
DROP TABLE IF EXISTS `zxwx_school_leave`;
CREATE TABLE `zxwx_school_leave` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `school_id` int(11) NOT NULL COMMENT '学校ID',
  `user_id` int(11) NOT NULL COMMENT '学生ID',
  `date_time` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '请假日期，数组类型，以逗号分隔',
  `approver_id` int(11) NOT NULL DEFAULT '0' COMMENT '审批人ID',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `state` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '待处理' COMMENT '待处理、同意、不同意',
  `content` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '具体请假内容',
  `opt_time` timestamp NULL DEFAULT NULL COMMENT '老师处理时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of zxwx_school_leave
-- ----------------------------
INSERT INTO `zxwx_school_leave` VALUES ('14', '29', '43', '2019-04-19', '37', '2019-04-18 09:46:52', '不同意', 'k', '2019-04-18 11:51:26');
INSERT INTO `zxwx_school_leave` VALUES ('15', '29', '52', '2019-04-19', '51', '2019-04-18 19:26:09', '同意', '明天去北京走亲戚', '2019-04-18 19:26:21');
INSERT INTO `zxwx_school_leave` VALUES ('16', '31', '54', '2019-04-19', '53', '2019-04-18 21:00:33', '待处理', '我明天请假，去玩啊', null);
INSERT INTO `zxwx_school_leave` VALUES ('17', '29', '43', '2019-04-21,2019-04-22', '37', '2019-04-20 07:58:39', '同意', '赶紧起', '2019-04-20 19:45:46');

-- ----------------------------
-- Table structure for zxwx_school_notice
-- ----------------------------
DROP TABLE IF EXISTS `zxwx_school_notice`;
CREATE TABLE `zxwx_school_notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `school_id` int(11) NOT NULL COMMENT '学校ID',
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '通知' COMMENT '通知标题',
  `notice_range` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '通知范围',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '发布时间',
  `user_type` int(3) NOT NULL DEFAULT '2' COMMENT '发布人类型1：系统用户；2：普通用户',
  `user_id` int(11) NOT NULL COMMENT '发布人ID',
  `user_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '发布人',
  `content` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '通知内容',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of zxwx_school_notice
-- ----------------------------
INSERT INTO `zxwx_school_notice` VALUES ('7', '29', '通知', '一班', '2019-04-16 14:26:16', '2', '38', '杨涛', '今天放假一天');
INSERT INTO `zxwx_school_notice` VALUES ('8', '29', '通知', '一班', '2019-04-16 14:27:11', '2', '38', '杨涛', '明天集体去种树');
INSERT INTO `zxwx_school_notice` VALUES ('9', '29', '通知', '三班', '2019-04-18 20:13:36', '2', '51', '杨英', '本费1元');

-- ----------------------------
-- Table structure for zxwx_school_pay
-- ----------------------------
DROP TABLE IF EXISTS `zxwx_school_pay`;
CREATE TABLE `zxwx_school_pay` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '操作时间',
  `app_id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '被微信支付的小程序APPID',
  `mch_id` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '被微信支付的小程序商户号',
  `open_id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '微信唯一值',
  `order_code` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '订单号(格式是日期+用户ID)',
  `total_fee` int(11) NOT NULL DEFAULT '0' COMMENT '金额(单位：分)',
  `state` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '订单状态',
  `attach` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '收费表ID，用于判断交费情况',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of zxwx_school_pay
-- ----------------------------

-- ----------------------------
-- Table structure for zxwx_score_type
-- ----------------------------
DROP TABLE IF EXISTS `zxwx_score_type`;
CREATE TABLE `zxwx_score_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '考试类别表：课堂测、周测、月考、模拟考、期中考试、期末考试',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of zxwx_score_type
-- ----------------------------
INSERT INTO `zxwx_score_type` VALUES ('1', '课堂测');
INSERT INTO `zxwx_score_type` VALUES ('2', '周测');
INSERT INTO `zxwx_score_type` VALUES ('3', '月考');
INSERT INTO `zxwx_score_type` VALUES ('4', '模拟考');
INSERT INTO `zxwx_score_type` VALUES ('5', '期中考试');
INSERT INTO `zxwx_score_type` VALUES ('6', '期末考试');

-- ----------------------------
-- Table structure for zxwx_student_score
-- ----------------------------
DROP TABLE IF EXISTS `zxwx_student_score`;
CREATE TABLE `zxwx_student_score` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '学号',
  `test_number` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '考号',
  `score` float(11,1) NOT NULL DEFAULT '0.0' COMMENT '总分',
  `read_state` int(2) NOT NULL DEFAULT '0' COMMENT '学生读取状态',
  `subject_id` int(11) NOT NULL DEFAULT '0' COMMENT '科目id',
  `score_desc` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '本次考试描述：考试类别-描述',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `full_score` int(3) NOT NULL DEFAULT '100' COMMENT '满分',
  `score_type_id` int(11) NOT NULL DEFAULT '0' COMMENT '考试类别id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=546 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of zxwx_student_score
-- ----------------------------

-- ----------------------------
-- Table structure for zxwx_subject
-- ----------------------------
DROP TABLE IF EXISTS `zxwx_subject`;
CREATE TABLE `zxwx_subject` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subject_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '科目名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of zxwx_subject
-- ----------------------------
INSERT INTO `zxwx_subject` VALUES ('1', '语文');
INSERT INTO `zxwx_subject` VALUES ('2', '数学');
INSERT INTO `zxwx_subject` VALUES ('3', '英语');
INSERT INTO `zxwx_subject` VALUES ('4', '政治');
INSERT INTO `zxwx_subject` VALUES ('5', '地理');
INSERT INTO `zxwx_subject` VALUES ('6', '化学');
INSERT INTO `zxwx_subject` VALUES ('7', '物理');

-- ----------------------------
-- Table structure for zxwx_submit_job_content
-- ----------------------------
DROP TABLE IF EXISTS `zxwx_submit_job_content`;
CREATE TABLE `zxwx_submit_job_content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_id` int(11) NOT NULL COMMENT '作业表ID',
  `from_user_id` int(11) NOT NULL COMMENT '提交作业的学生ID',
  `type` int(2) NOT NULL COMMENT '内容类型：1文本内容；2语音内容；3图片内容；4视频内容；',
  `content` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '具体作业内容',
  `duration` int(20) DEFAULT '0' COMMENT '语音时长',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of zxwx_submit_job_content
-- ----------------------------
INSERT INTO `zxwx_submit_job_content` VALUES ('13', '42', '43', '3', 'http://www.cxyd.ltd/cxyd_static/Qp61T036Kz98bCbSH2Sxho39.jpg', '0');
INSERT INTO `zxwx_submit_job_content` VALUES ('14', '44', '43', '1', '作业', '0');
INSERT INTO `zxwx_submit_job_content` VALUES ('15', '44', '39', '1', '？', '0');
INSERT INTO `zxwx_submit_job_content` VALUES ('16', '45', '43', '1', '2', '0');
INSERT INTO `zxwx_submit_job_content` VALUES ('17', '47', '52', '2', 'http://www.cxyd.ltd/cxyd_static/Tn_Ey7ssPOPPdKA--_-jT3BU.mp3', '4');

-- ----------------------------
-- Table structure for zxwx_sys_user
-- ----------------------------
DROP TABLE IF EXISTS `zxwx_sys_user`;
CREATE TABLE `zxwx_sys_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sys_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '用户名称',
  `sys_full_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '用户全名',
  `pwd` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'f982c4a40e28dcc51cfce7a4b656b03c' COMMENT '登陆密码',
  `status` int(4) NOT NULL DEFAULT '1' COMMENT '是否有效：1表示有效；0表示无效',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `school_id` int(11) NOT NULL COMMENT '学校表中的id字段',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of zxwx_sys_user
-- ----------------------------
INSERT INTO `zxwx_sys_user` VALUES ('1', 'admin', '超级管理员', 'e10adc3949ba59abbe56e057f20f883e', '1', '2019-03-23 17:01:48', '0');
INSERT INTO `zxwx_sys_user` VALUES ('14', 'll', '管理员', 'e10adc3949ba59abbe56e057f20f883e', '1', '2019-03-25 20:42:44', '0');
INSERT INTO `zxwx_sys_user` VALUES ('25', 'yd', '源点小学', '3d9188577cc9bfe9291ac66b5cc872b7', '1', '2019-04-16 10:50:33', '29');
INSERT INTO `zxwx_sys_user` VALUES ('26', 'huaxiaguoxue', '华夏国学幼儿园', 'e10adc3949ba59abbe56e057f20f883e', '1', '2019-04-17 15:00:07', '30');
INSERT INTO `zxwx_sys_user` VALUES ('27', 'yangguang', '阳光幼儿园', '3d9188577cc9bfe9291ac66b5cc872b7', '1', '2019-04-18 20:44:24', '31');

-- ----------------------------
-- Table structure for zxwx_user
-- ----------------------------
DROP TABLE IF EXISTS `zxwx_user`;
CREATE TABLE `zxwx_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '用户姓名',
  `role` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '学生' COMMENT '老师/学生',
  `school_id` int(10) NOT NULL COMMENT '学校表中的id字段',
  `student_id` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '学号',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `sex` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT '男' COMMENT '性别：男/女',
  `status` int(4) NOT NULL DEFAULT '1' COMMENT '是否有效：1表示有效；0表示无效',
  `vip_status` int(4) DEFAULT '0' COMMENT 'Vip缴费状态：1已缴费；0未缴费',
  `vip_expire_time` timestamp NULL DEFAULT NULL COMMENT 'Vip到期时间',
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of zxwx_user
-- ----------------------------
INSERT INTO `zxwx_user` VALUES ('37', '李静', '老师', '29', null, '2019-04-16 10:53:49', '男', '1', null, null, '13311111111');
INSERT INTO `zxwx_user` VALUES ('38', '杨涛', '老师', '29', null, '2019-04-16 10:54:41', '男', '1', null, null, '13311111112');
INSERT INTO `zxwx_user` VALUES ('39', '李伦', '学生', '29', '20190101', '2019-04-16 10:57:42', '男', '1', '0', null, null);
INSERT INTO `zxwx_user` VALUES ('40', '张涛', '学生', '29', '20190102', '2019-04-16 10:57:57', '男', '1', '0', null, null);
INSERT INTO `zxwx_user` VALUES ('41', '张强', '学生', '29', '20190201', '2019-04-16 10:58:38', '男', '1', '0', null, null);
INSERT INTO `zxwx_user` VALUES ('42', '小宁', '学生', '29', '20190202', '2019-04-16 10:58:48', '男', '1', '0', null, null);
INSERT INTO `zxwx_user` VALUES ('43', '张三', '学生', '29', '20190103', '2019-04-16 10:59:32', '男', '1', '0', null, null);
INSERT INTO `zxwx_user` VALUES ('44', '李四', '学生', '29', '20190104', '2019-04-16 10:59:42', '男', '1', '0', null, null);
INSERT INTO `zxwx_user` VALUES ('45', '王五', '学生', '29', '20190105', '2019-04-16 10:59:50', '男', '1', '0', null, null);
INSERT INTO `zxwx_user` VALUES ('46', '王彩虹', '老师', '29', null, '2019-04-17 11:08:20', '男', '1', null, null, '13311111115');
INSERT INTO `zxwx_user` VALUES ('47', '张楠', '老师', '30', null, '2019-04-17 15:01:53', '男', '1', null, null, '13111111111');
INSERT INTO `zxwx_user` VALUES ('48', '张三', '学生', '30', '20190111', '2019-04-17 15:35:19', '男', '1', '0', null, null);
INSERT INTO `zxwx_user` VALUES ('49', '李四', '学生', '30', '201901021', '2019-04-17 15:35:30', '男', '1', '0', null, null);
INSERT INTO `zxwx_user` VALUES ('50', '杨英', '老师', '29', null, '2019-04-18 18:54:53', '男', '0', null, null, '13311111113');
INSERT INTO `zxwx_user` VALUES ('51', '杨英', '老师', '29', null, '2019-04-18 18:55:45', '男', '1', null, null, '13311111113');
INSERT INTO `zxwx_user` VALUES ('52', '杨涛', '学生', '29', '20190113', '2019-04-18 18:56:10', '男', '1', '0', null, null);
INSERT INTO `zxwx_user` VALUES ('53', '小丽', '老师', '31', null, '2019-04-18 20:45:45', '男', '1', null, null, '13212341234');
INSERT INTO `zxwx_user` VALUES ('54', '郭晓明', '学生', '31', '201901014', '2019-04-18 20:46:22', '男', '1', '0', null, null);
INSERT INTO `zxwx_user` VALUES ('55', '张三梅', '学生', '31', '201901025', '2019-04-18 20:46:36', '男', '1', '0', null, null);
INSERT INTO `zxwx_user` VALUES ('56', '测试', '老师', '29', null, '2019-04-19 09:43:33', '男', '0', null, null, '13146877711');
INSERT INTO `zxwx_user` VALUES ('61', '测试1', '老师', '29', null, '2019-04-19 10:16:31', '男', '0', null, null, '13146877111');
INSERT INTO `zxwx_user` VALUES ('62', '测试1', '老师', '29', null, '2019-04-19 10:34:23', '男', '0', null, null, '13146877111');
INSERT INTO `zxwx_user` VALUES ('63', '测试1', '老师', '29', null, '2019-04-19 10:39:10', '男', '0', null, null, '13146877111');
INSERT INTO `zxwx_user` VALUES ('64', '测试1', '老师', '29', null, '2019-04-19 10:41:37', '男', '0', null, null, '13146877111');
INSERT INTO `zxwx_user` VALUES ('65', '测试2', '老师', '29', null, '2019-04-19 10:42:08', '男', '0', null, null, '13146871111');
INSERT INTO `zxwx_user` VALUES ('66', '测试2', '老师', '29', null, '2019-04-19 10:42:53', '男', '0', null, null, '13146888888');
INSERT INTO `zxwx_user` VALUES ('67', '测试1', '老师', '29', null, '2019-04-19 10:45:03', '男', '0', null, null, '13146877111');
INSERT INTO `zxwx_user` VALUES ('68', '测试1', '老师', '29', null, '2019-04-19 10:46:36', '男', '0', null, null, '13146877111');
INSERT INTO `zxwx_user` VALUES ('69', '测试2', '老师', '29', null, '2019-04-19 10:48:50', '男', '0', null, null, '13146871111');
INSERT INTO `zxwx_user` VALUES ('70', '测试3', '老师', '29', null, '2019-04-19 10:51:17', '男', '0', null, null, '13146811122');
INSERT INTO `zxwx_user` VALUES ('71', '测试2', '老师', '29', null, '2019-04-19 11:18:01', '男', '0', null, null, '13146877711');
INSERT INTO `zxwx_user` VALUES ('72', '测试3', '老师', '29', null, '2019-04-19 11:40:02', '男', '0', null, null, '13146877711');
INSERT INTO `zxwx_user` VALUES ('73', '测试4', '老师', '29', null, '2019-04-19 14:08:35', '男', '0', null, null, '13146788877');
INSERT INTO `zxwx_user` VALUES ('74', '测试1', '老师', '29', null, '2019-04-19 14:11:15', '男', '0', null, null, '13146877711');
INSERT INTO `zxwx_user` VALUES ('84', '小宁老师', '老师', '29', null, '2019-04-23 08:56:28', '男', '1', null, null, '13313331333');

-- ----------------------------
-- Table structure for zxwx_user_class_map
-- ----------------------------
DROP TABLE IF EXISTS `zxwx_user_class_map`;
CREATE TABLE `zxwx_user_class_map` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '普通用户表ID',
  `class_id` int(11) NOT NULL COMMENT '班级表ID',
  `subjects` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '科目ID,以逗号分隔',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=141 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of zxwx_user_class_map
-- ----------------------------
INSERT INTO `zxwx_user_class_map` VALUES ('58', '37', '19', '1');
INSERT INTO `zxwx_user_class_map` VALUES ('59', '37', '18', '1');
INSERT INTO `zxwx_user_class_map` VALUES ('61', '39', '18', null);
INSERT INTO `zxwx_user_class_map` VALUES ('62', '40', '18', null);
INSERT INTO `zxwx_user_class_map` VALUES ('67', '43', '18', null);
INSERT INTO `zxwx_user_class_map` VALUES ('68', '44', '18', null);
INSERT INTO `zxwx_user_class_map` VALUES ('69', '45', '18', null);
INSERT INTO `zxwx_user_class_map` VALUES ('70', '46', '18', '1');
INSERT INTO `zxwx_user_class_map` VALUES ('71', '47', '20', '1');
INSERT INTO `zxwx_user_class_map` VALUES ('72', '48', '20', null);
INSERT INTO `zxwx_user_class_map` VALUES ('73', '49', '20', null);
INSERT INTO `zxwx_user_class_map` VALUES ('74', '50', '18', '2');
INSERT INTO `zxwx_user_class_map` VALUES ('75', '51', '21', '2');
INSERT INTO `zxwx_user_class_map` VALUES ('76', '52', '21', null);
INSERT INTO `zxwx_user_class_map` VALUES ('82', '38', '18', '2');
INSERT INTO `zxwx_user_class_map` VALUES ('83', '53', '22', '1');
INSERT INTO `zxwx_user_class_map` VALUES ('84', '54', '22', null);
INSERT INTO `zxwx_user_class_map` VALUES ('85', '55', '22', null);
INSERT INTO `zxwx_user_class_map` VALUES ('86', '56', '19', '1');
INSERT INTO `zxwx_user_class_map` VALUES ('87', '56', '18', '1');
INSERT INTO `zxwx_user_class_map` VALUES ('88', '56', '19', '1');
INSERT INTO `zxwx_user_class_map` VALUES ('89', '57', '19', '1');
INSERT INTO `zxwx_user_class_map` VALUES ('90', '57', '18', '1');
INSERT INTO `zxwx_user_class_map` VALUES ('91', '57', '19', '1');
INSERT INTO `zxwx_user_class_map` VALUES ('92', '58', '19', '1,2');
INSERT INTO `zxwx_user_class_map` VALUES ('93', '58', '18', '1,2');
INSERT INTO `zxwx_user_class_map` VALUES ('94', '58', '19', '1,2');
INSERT INTO `zxwx_user_class_map` VALUES ('95', '59', '18', '1');
INSERT INTO `zxwx_user_class_map` VALUES ('96', '59', '18', '1');
INSERT INTO `zxwx_user_class_map` VALUES ('97', '60', '18', '1');
INSERT INTO `zxwx_user_class_map` VALUES ('98', '60', '18', '1');
INSERT INTO `zxwx_user_class_map` VALUES ('99', '61', '18', '1');
INSERT INTO `zxwx_user_class_map` VALUES ('100', '61', '18', '1');
INSERT INTO `zxwx_user_class_map` VALUES ('101', '62', '19', '1');
INSERT INTO `zxwx_user_class_map` VALUES ('102', '63', '19', '1');
INSERT INTO `zxwx_user_class_map` VALUES ('103', '64', '19', '1');
INSERT INTO `zxwx_user_class_map` VALUES ('104', '65', '19', '1');
INSERT INTO `zxwx_user_class_map` VALUES ('105', '66', '19', '1');
INSERT INTO `zxwx_user_class_map` VALUES ('106', '67', '19', '1,2');
INSERT INTO `zxwx_user_class_map` VALUES ('107', '68', '19', '1');
INSERT INTO `zxwx_user_class_map` VALUES ('108', '68', '18', '1');
INSERT INTO `zxwx_user_class_map` VALUES ('109', '68', '19', '1');
INSERT INTO `zxwx_user_class_map` VALUES ('110', '69', '19', '1');
INSERT INTO `zxwx_user_class_map` VALUES ('111', '69', '18', '1');
INSERT INTO `zxwx_user_class_map` VALUES ('112', '69', '19', '1');
INSERT INTO `zxwx_user_class_map` VALUES ('113', '70', '19', '1');
INSERT INTO `zxwx_user_class_map` VALUES ('114', '70', '18', '1');
INSERT INTO `zxwx_user_class_map` VALUES ('115', '70', '19', '1');
INSERT INTO `zxwx_user_class_map` VALUES ('116', '71', '19', '1');
INSERT INTO `zxwx_user_class_map` VALUES ('117', '71', '18', '1');
INSERT INTO `zxwx_user_class_map` VALUES ('118', '71', '19', '1');
INSERT INTO `zxwx_user_class_map` VALUES ('119', '72', '19', '1');
INSERT INTO `zxwx_user_class_map` VALUES ('120', '72', '18', '1');
INSERT INTO `zxwx_user_class_map` VALUES ('121', '72', '19', '1');
INSERT INTO `zxwx_user_class_map` VALUES ('122', '72', '19', '1');
INSERT INTO `zxwx_user_class_map` VALUES ('123', '72', '18', '1');
INSERT INTO `zxwx_user_class_map` VALUES ('124', '73', '19', '1');
INSERT INTO `zxwx_user_class_map` VALUES ('125', '73', '18', '1');
INSERT INTO `zxwx_user_class_map` VALUES ('126', '74', '21', '1');
INSERT INTO `zxwx_user_class_map` VALUES ('127', '74', '18', '1');
INSERT INTO `zxwx_user_class_map` VALUES ('128', '74', '19', '1');
INSERT INTO `zxwx_user_class_map` VALUES ('129', '75', '18', null);
INSERT INTO `zxwx_user_class_map` VALUES ('130', '76', '18', null);
INSERT INTO `zxwx_user_class_map` VALUES ('131', '77', '18', null);
INSERT INTO `zxwx_user_class_map` VALUES ('132', '78', '18', null);
INSERT INTO `zxwx_user_class_map` VALUES ('133', '79', '18', null);
INSERT INTO `zxwx_user_class_map` VALUES ('134', '80', '18', null);
INSERT INTO `zxwx_user_class_map` VALUES ('135', '81', '18', null);
INSERT INTO `zxwx_user_class_map` VALUES ('136', '82', '18', null);
INSERT INTO `zxwx_user_class_map` VALUES ('137', '83', '18', null);
INSERT INTO `zxwx_user_class_map` VALUES ('138', '42', '18', null);
INSERT INTO `zxwx_user_class_map` VALUES ('139', '41', '18', null);
INSERT INTO `zxwx_user_class_map` VALUES ('140', '84', '18', '3');

-- ----------------------------
-- Table structure for zxwx_vip
-- ----------------------------
DROP TABLE IF EXISTS `zxwx_vip`;
CREATE TABLE `zxwx_vip` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image_path` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '图片位置',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of zxwx_vip
-- ----------------------------
INSERT INTO `zxwx_vip` VALUES ('5', 'bf53133e-917c-4cc3-ba7b-1b594e7f18e6.png');

-- ----------------------------
-- Table structure for zxwx_vip_log
-- ----------------------------
DROP TABLE IF EXISTS `zxwx_vip_log`;
CREATE TABLE `zxwx_vip_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '操作时间',
  `app_id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '被微信支付的小程序APPID',
  `mch_id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '被微信支付的小程序商户号',
  `open_id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '微信唯一值',
  `order_code` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '订单号(格式是日期+用户ID)',
  `total_fee` int(11) NOT NULL DEFAULT '0' COMMENT '金额(单位：分)',
  `state` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '订单状态',
  `attach` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '用户ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of zxwx_vip_log
-- ----------------------------
