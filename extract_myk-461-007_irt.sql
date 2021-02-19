\copy (SELECT quanity_dosed, protocol, drug_unit_id, visit_name, finished_lot, quantity_remaining, destruction_date, site_e_signature_user, subject_number, shipment_id, id_, ddf_comment, monitor_reconciliation_comment, shipment_ordered_date, quantity_dispensed, assigned_date, quantity_missing, subject_accountability_comment, subject_accountability_date, shipment_receipt_date, monitor_reconciliation_date, ddf_status, quantity_destroyed, destruction_shipment_date, drug_code, depot_id, unblinded_drug_description, destruction_e_signature_user, site_id, monitor_e_signature_user, destruction_tracking_number FROM myk461007_irt.drug_accountability) to 'drug_accountability.csv' csv header;
\copy (SELECT country, protocol, date_of_birth, subject_number, id_, qtcf_ms_rand, qtcf_ms_w24, gender, site_id, lvef__w24 FROM myk461007_irt.eligibility) to 'eligibility.csv' csv header;
\copy (SELECT protocol, stratum_code, randomization_number, subject_number, id_, randomization_date, stratum_description, site_id FROM myk461007_irt.randomization) to 'randomization.csv' csv header;
\copy (SELECT protocol, expected_visit_date, visit, assigned_drug, finished_lot, parent_study_treatment, date_of_birth, subject_number, id_, status, gender, drug_code, treatment_code, visit_date, unblinded_drug_description, site_id, treatment, quantity_bottles_dispensed FROM myk461007_irt.subject_visit) to 'subject_visit.csv' csv header;