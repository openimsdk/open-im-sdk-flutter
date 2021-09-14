class MessageType {
  ///
  static const text = 101;
  static const picture = 102;
  static const voice = 103;
  static const video = 104;
  static const file = 105;
  static const at_text = 106;
  static const merger = 107;
  // static const forward = 108;
  static const card = 108;
  static const location = 109;
  static const custom = 110;
  static const revoke = 111;
  static const has_read_receipt = 112;
  static const typing = 113;
  static const quote = 114;

  ///
  static const accept_friend = 201;
  static const add_friend = 202;
  static const refuse_friend_application = 203;
  static const set_self_info = 204;
  static const revoke_message = 205;
  static const c2c_message_as_read = 206;

  static const kick_online = 303;

  ///
  static const transfer_group_owner = 501;
  static const create_group = 502;
  // static const create_group = 503;
  static const join_group = 504;
  static const quit_group = 505;
  static const set_group_info = 506;
  static const accept_group_application = 507;
  static const refuse_group_application = 508;
  static const kick_group_member = 509;
  static const invited_user_to_group = 510;
}
