-- MySQL Find out which rows/records are corrupted in which tables of the SQL Integrity 1452 error
-- example
FK_CAT_PRD_FLAT_2_ENTT_ID_CAT_PRD_ENTT_ENTT_ID
-- means
SELECT a.entity_id FROM catalog_product_flat_2 AS a LEFT JOIN catalog_product_entity AS b ON a.entity_id = b.entity_id WHERE ISNULL(b.entity_id);

FK_CAT_PRD_FLAT_1_ENTT_ID_CAT_PRD_ENTT_ENTT_ID
-- means
SELECT a.entity_id FROM catalog_product_flat_1 AS a LEFT JOIN catalog_product_entity AS b ON a.entity_id = b.entity_id WHERE ISNULL(b.entity_id);

-- even better
SELECT a.entity_id,b.entity_id FROM catalog_product_flat_1 AS a LEFT JOIN catalog_product_entity AS b ON a.entity_id = b.entity_id WHERE ISNULL(b.entity_id)
SELECT a.entity_id,
       b.entity_id
FROM catalog_product_flat_1 AS a
LEFT JOIN catalog_product_entity AS b ON a.entity_id = b.entity_id
WHERE ISNULL(b.entity_id)

DELETE a.*
FROM catalog_product_flat_1 AS a
LEFT JOIN catalog_product_entity AS b ON a.entity_id = b.entity_id
WHERE ISNULL(b.entity_id)

DELETE cpf1.*
FROM catalog_product_flat_1 AS cpf1
LEFT JOIN catalog_product_entity AS cpe ON cpf1.entity_id = cpe.entity_id
WHERE ISNULL(cpe.entity_id)
