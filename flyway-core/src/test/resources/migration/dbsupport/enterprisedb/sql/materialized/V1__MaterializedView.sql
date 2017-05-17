--
-- Copyright 2010-2017 Boxfuse GmbH
--
-- Licensed under the Apache License, Version 2.0 (the "License");
-- you may not use this file except in compliance with the License.
-- You may obtain a copy of the License at
--
--         http://www.apache.org/licenses/LICENSE-2.0
--
-- Unless required by applicable law or agreed to in writing, software
-- distributed under the License is distributed on an "AS IS" BASIS,
-- WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
-- See the License for the specific language governing permissions and
-- limitations under the License.
--

CREATE MATERIALIZED VIEW v_dwh_dim_date_mat AS select now();

CREATE MATERIALIZED VIEW """v_dwh_dim_date_mat2""" AS select now();

CREATE OR REPLACE VIEW v_dwh_dim_date AS SELECT * from v_dwh_dim_date_mat;

CREATE TABLE test_user (
  id INT NOT NULL,
  name VARCHAR(25) NOT NULL,
  PRIMARY KEY(name)
);

CREATE MATERIALIZED VIEW user_data REFRESH COMPLETE
   AS SELECT * FROM test_user;

CREATE MATERIALIZED VIEW log BUILD IMMEDIATE
   AS SELECT * FROM test_user;

CREATE MATERIALIZED VIEW more_user_data BUILD IMMEDIATE
   REFRESH ON DEMAND
   AS SELECT * FROM test_user;