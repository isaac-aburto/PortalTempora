using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebSolicitudes.Models
{
    public class WebhookCrearPerson
    {

        public class WebhookPerson
        {
            public int v { get; set; }
            public Matches_Filters matches_filters { get; set; }
            public Meta meta { get; set; }
            public Current current { get; set; }
            public object previous { get; set; }
            public string _event { get; set; }
            public int retry { get; set; }
            public Email email { get; set; }
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
            public int related_closed_deals_count { get; set; }
            public int email_messages_count { get; set; }
            public string cc_email { get; set; }
            public int owner_id { get; set; }
            public int open_deals_count { get; set; }
            public object last_outgoing_mail_time { get; set; }
            public bool active_flag { get; set; }
            public object picture_id { get; set; }
            public object last_activity_id { get; set; }
            public object next_activity_date { get; set; }
            public string update_time { get; set; }
            public int participant_open_deals_count { get; set; }
            public int activities_count { get; set; }
            public int id { get; set; }
            public object org_name { get; set; }
            public string first_name { get; set; }
            public Email[] email { get; set; }
            public int won_deals_count { get; set; }
            public string owner_name { get; set; }
            public int files_count { get; set; }
            public int company_id { get; set; }
            public int related_won_deals_count { get; set; }
            public object last_incoming_mail_time { get; set; }
            public string first_char { get; set; }
            public int undone_activities_count { get; set; }
            public int closed_deals_count { get; set; }
            public string last_name { get; set; }
            public object last_activity_date { get; set; }
            public object label { get; set; }
            public object next_activity_id { get; set; }
            public int related_lost_deals_count { get; set; }
            public int related_open_deals_count { get; set; }
            public Phone[] phone { get; set; }
            public string visible_to { get; set; }
            public object org_id { get; set; }
            public int notes_count { get; set; }
            public int followers_count { get; set; }
            public string name { get; set; }
            public int participant_closed_deals_count { get; set; }
            public int lost_deals_count { get; set; }
            public object next_activity_time { get; set; }
            public string add_time { get; set; }
            public int done_activities_count { get; set; }
        }

        public class Email
        {
            public string label { get; set; }
            public string value { get; set; }
            public bool primary { get; set; }
        }

        public class Phone
        {
            public string label { get; set; }
            public string value { get; set; }
            public bool primary { get; set; }
        }

    }
}