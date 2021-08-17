using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace WebSolicitudes.Models
{
    public class WebhookUpdateDeal : Controller
    {
        //
        // GET: /WebhookUpdateDeal/

        public class UpdateDeal
        {
            public int v { get; set; }
            public Matches_Filters matches_filters { get; set; }
            public Meta meta { get; set; }
            public Current current { get; set; }
            public Previous previous { get; set; }
            public string _event { get; set; }
            public int retry { get; set; }
        }

        public class Matches_Filters
        {
            public object[] current { get; set; }
        }

        public class Meta
        {
            public string action { get; set; }
            public string change_source { get; set; }
            public int company_id { get; set; }
            public string host { get; set; }
            public int id { get; set; }
            public bool is_bulk_update { get; set; }
            public Matches_Filters1 matches_filters { get; set; }
            public string _object { get; set; }
            public int[] permitted_user_ids { get; set; }
            public bool pipedrive_service_name { get; set; }
            public int timestamp { get; set; }
            public long timestamp_micro { get; set; }
            public bool trans_pending { get; set; }
            public int user_id { get; set; }
            public int v { get; set; }
            public string webhook_id { get; set; }
        }

        public class Matches_Filters1
        {
            public object[] current { get; set; }
        }

        public class Current
        {
            public int email_messages_count { get; set; }
            public string cc_email { get; set; }
            public int products_count { get; set; }
            public object next_activity_date { get; set; }
            public object next_activity_type { get; set; }
            public object next_activity_duration { get; set; }
            public int id { get; set; }
            public int person_id { get; set; }
            public int creator_user_id { get; set; }
            public string expected_close_date { get; set; }
            public string owner_name { get; set; }
            public int participants_count { get; set; }
            public object group_name { get; set; }
            public int stage_id { get; set; }
            public object probability { get; set; }
            public int undone_activities_count { get; set; }
            public string renewal_type { get; set; }
            public bool active { get; set; }
            public string person_name { get; set; }
            public object last_activity_date { get; set; }
            public object close_time { get; set; }
            public bool org_hidden { get; set; }
            public object next_activity_id { get; set; }
            public string weighted_value_currency { get; set; }
            public int stage_order_nr { get; set; }
            public object next_activity_subject { get; set; }
            public object rotten_time { get; set; }
            public int user_id { get; set; }
            public string visible_to { get; set; }
            public object org_id { get; set; }
            public int notes_count { get; set; }
            public object next_activity_time { get; set; }
            public string formatted_value { get; set; }
            public string status { get; set; }
            public string formatted_weighted_value { get; set; }
            public object first_won_time { get; set; }
            public object last_outgoing_mail_time { get; set; }
            public string title { get; set; }
            public object last_activity_id { get; set; }
            public string update_time { get; set; }
            public int activities_count { get; set; }
            public int pipeline_id { get; set; }
            public object lost_time { get; set; }
            public string currency { get; set; }
            public int weighted_value { get; set; }
            public object org_name { get; set; }
            public int value { get; set; }
            public bool person_hidden { get; set; }
            public object next_activity_note { get; set; }
            public int files_count { get; set; }
            public object last_incoming_mail_time { get; set; }
            public object label { get; set; }
            public object lost_reason { get; set; }
            public bool deleted { get; set; }
            public object won_time { get; set; }
            public object group_id { get; set; }
            public int followers_count { get; set; }
            public string stage_change_time { get; set; }
            public string add_time { get; set; }
            public int done_activities_count { get; set; }
        }

        public class Previous
        {
            public int email_messages_count { get; set; }
            public string cc_email { get; set; }
            public int products_count { get; set; }
            public object next_activity_date { get; set; }
            public object next_activity_type { get; set; }
            public object next_activity_duration { get; set; }
            public int id { get; set; }
            public int person_id { get; set; }
            public int creator_user_id { get; set; }
            public string expected_close_date { get; set; }
            public string owner_name { get; set; }
            public int participants_count { get; set; }
            public object group_name { get; set; }
            public int stage_id { get; set; }
            public object probability { get; set; }
            public int undone_activities_count { get; set; }
            public string renewal_type { get; set; }
            public bool active { get; set; }
            public string person_name { get; set; }
            public object last_activity_date { get; set; }
            public object close_time { get; set; }
            public bool org_hidden { get; set; }
            public object next_activity_id { get; set; }
            public string weighted_value_currency { get; set; }
            public int stage_order_nr { get; set; }
            public object next_activity_subject { get; set; }
            public object rotten_time { get; set; }
            public int user_id { get; set; }
            public string visible_to { get; set; }
            public object org_id { get; set; }
            public int notes_count { get; set; }
            public object next_activity_time { get; set; }
            public string formatted_value { get; set; }
            public string status { get; set; }
            public string formatted_weighted_value { get; set; }
            public object first_won_time { get; set; }
            public object last_outgoing_mail_time { get; set; }
            public string title { get; set; }
            public object last_activity_id { get; set; }
            public string update_time { get; set; }
            public int activities_count { get; set; }
            public int pipeline_id { get; set; }
            public object lost_time { get; set; }
            public string currency { get; set; }
            public int weighted_value { get; set; }
            public object org_name { get; set; }
            public int value { get; set; }
            public bool person_hidden { get; set; }
            public object next_activity_note { get; set; }
            public int files_count { get; set; }
            public object last_incoming_mail_time { get; set; }
            public object label { get; set; }
            public object lost_reason { get; set; }
            public bool deleted { get; set; }
            public object won_time { get; set; }
            public object group_id { get; set; }
            public int followers_count { get; set; }
            public string stage_change_time { get; set; }
            public string add_time { get; set; }
            public int done_activities_count { get; set; }
        }

    }
}
