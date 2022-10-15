--
-- PostgreSQL database dump
--

-- Dumped from database version 14.5 (Debian 14.5-1.pgdg110+1)
-- Dumped by pg_dump version 14.5 (Ubuntu 14.5-0ubuntu0.22.04.1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: admin_event_entity; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.admin_event_entity (
    id character varying(36) NOT NULL,
    admin_event_time bigint,
    realm_id character varying(255),
    operation_type character varying(255),
    auth_realm_id character varying(255),
    auth_client_id character varying(255),
    auth_user_id character varying(255),
    ip_address character varying(255),
    resource_path character varying(2550),
    representation text,
    error character varying(255),
    resource_type character varying(64)
);


ALTER TABLE public.admin_event_entity OWNER TO keycloak;

--
-- Name: associated_policy; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.associated_policy (
    policy_id character varying(36) NOT NULL,
    associated_policy_id character varying(36) NOT NULL
);


ALTER TABLE public.associated_policy OWNER TO keycloak;

--
-- Name: authentication_execution; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.authentication_execution (
    id character varying(36) NOT NULL,
    alias character varying(255),
    authenticator character varying(36),
    realm_id character varying(36),
    flow_id character varying(36),
    requirement integer,
    priority integer,
    authenticator_flow boolean DEFAULT false NOT NULL,
    auth_flow_id character varying(36),
    auth_config character varying(36)
);


ALTER TABLE public.authentication_execution OWNER TO keycloak;

--
-- Name: authentication_flow; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.authentication_flow (
    id character varying(36) NOT NULL,
    alias character varying(255),
    description character varying(255),
    realm_id character varying(36),
    provider_id character varying(36) DEFAULT 'basic-flow'::character varying NOT NULL,
    top_level boolean DEFAULT false NOT NULL,
    built_in boolean DEFAULT false NOT NULL
);


ALTER TABLE public.authentication_flow OWNER TO keycloak;

--
-- Name: authenticator_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.authenticator_config (
    id character varying(36) NOT NULL,
    alias character varying(255),
    realm_id character varying(36)
);


ALTER TABLE public.authenticator_config OWNER TO keycloak;

--
-- Name: authenticator_config_entry; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.authenticator_config_entry (
    authenticator_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.authenticator_config_entry OWNER TO keycloak;

--
-- Name: broker_link; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.broker_link (
    identity_provider character varying(255) NOT NULL,
    storage_provider_id character varying(255),
    realm_id character varying(36) NOT NULL,
    broker_user_id character varying(255),
    broker_username character varying(255),
    token text,
    user_id character varying(255) NOT NULL
);


ALTER TABLE public.broker_link OWNER TO keycloak;

--
-- Name: client; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client (
    id character varying(36) NOT NULL,
    enabled boolean DEFAULT false NOT NULL,
    full_scope_allowed boolean DEFAULT false NOT NULL,
    client_id character varying(255),
    not_before integer,
    public_client boolean DEFAULT false NOT NULL,
    secret character varying(255),
    base_url character varying(255),
    bearer_only boolean DEFAULT false NOT NULL,
    management_url character varying(255),
    surrogate_auth_required boolean DEFAULT false NOT NULL,
    realm_id character varying(36),
    protocol character varying(255),
    node_rereg_timeout integer DEFAULT 0,
    frontchannel_logout boolean DEFAULT false NOT NULL,
    consent_required boolean DEFAULT false NOT NULL,
    name character varying(255),
    service_accounts_enabled boolean DEFAULT false NOT NULL,
    client_authenticator_type character varying(255),
    root_url character varying(255),
    description character varying(255),
    registration_token character varying(255),
    standard_flow_enabled boolean DEFAULT true NOT NULL,
    implicit_flow_enabled boolean DEFAULT false NOT NULL,
    direct_access_grants_enabled boolean DEFAULT false NOT NULL,
    always_display_in_console boolean DEFAULT false NOT NULL
);


ALTER TABLE public.client OWNER TO keycloak;

--
-- Name: client_attributes; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_attributes (
    client_id character varying(36) NOT NULL,
    value character varying(4000),
    name character varying(255) NOT NULL
);


ALTER TABLE public.client_attributes OWNER TO keycloak;

--
-- Name: client_auth_flow_bindings; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_auth_flow_bindings (
    client_id character varying(36) NOT NULL,
    flow_id character varying(36),
    binding_name character varying(255) NOT NULL
);


ALTER TABLE public.client_auth_flow_bindings OWNER TO keycloak;

--
-- Name: client_initial_access; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_initial_access (
    id character varying(36) NOT NULL,
    realm_id character varying(36) NOT NULL,
    "timestamp" integer,
    expiration integer,
    count integer,
    remaining_count integer
);


ALTER TABLE public.client_initial_access OWNER TO keycloak;

--
-- Name: client_node_registrations; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_node_registrations (
    client_id character varying(36) NOT NULL,
    value integer,
    name character varying(255) NOT NULL
);


ALTER TABLE public.client_node_registrations OWNER TO keycloak;

--
-- Name: client_scope; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_scope (
    id character varying(36) NOT NULL,
    name character varying(255),
    realm_id character varying(36),
    description character varying(255),
    protocol character varying(255)
);


ALTER TABLE public.client_scope OWNER TO keycloak;

--
-- Name: client_scope_attributes; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_scope_attributes (
    scope_id character varying(36) NOT NULL,
    value character varying(2048),
    name character varying(255) NOT NULL
);


ALTER TABLE public.client_scope_attributes OWNER TO keycloak;

--
-- Name: client_scope_client; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_scope_client (
    client_id character varying(255) NOT NULL,
    scope_id character varying(255) NOT NULL,
    default_scope boolean DEFAULT false NOT NULL
);


ALTER TABLE public.client_scope_client OWNER TO keycloak;

--
-- Name: client_scope_role_mapping; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_scope_role_mapping (
    scope_id character varying(36) NOT NULL,
    role_id character varying(36) NOT NULL
);


ALTER TABLE public.client_scope_role_mapping OWNER TO keycloak;

--
-- Name: client_session; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_session (
    id character varying(36) NOT NULL,
    client_id character varying(36),
    redirect_uri character varying(255),
    state character varying(255),
    "timestamp" integer,
    session_id character varying(36),
    auth_method character varying(255),
    realm_id character varying(255),
    auth_user_id character varying(36),
    current_action character varying(36)
);


ALTER TABLE public.client_session OWNER TO keycloak;

--
-- Name: client_session_auth_status; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_session_auth_status (
    authenticator character varying(36) NOT NULL,
    status integer,
    client_session character varying(36) NOT NULL
);


ALTER TABLE public.client_session_auth_status OWNER TO keycloak;

--
-- Name: client_session_note; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_session_note (
    name character varying(255) NOT NULL,
    value character varying(255),
    client_session character varying(36) NOT NULL
);


ALTER TABLE public.client_session_note OWNER TO keycloak;

--
-- Name: client_session_prot_mapper; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_session_prot_mapper (
    protocol_mapper_id character varying(36) NOT NULL,
    client_session character varying(36) NOT NULL
);


ALTER TABLE public.client_session_prot_mapper OWNER TO keycloak;

--
-- Name: client_session_role; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_session_role (
    role_id character varying(255) NOT NULL,
    client_session character varying(36) NOT NULL
);


ALTER TABLE public.client_session_role OWNER TO keycloak;

--
-- Name: client_user_session_note; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_user_session_note (
    name character varying(255) NOT NULL,
    value character varying(2048),
    client_session character varying(36) NOT NULL
);


ALTER TABLE public.client_user_session_note OWNER TO keycloak;

--
-- Name: component; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.component (
    id character varying(36) NOT NULL,
    name character varying(255),
    parent_id character varying(36),
    provider_id character varying(36),
    provider_type character varying(255),
    realm_id character varying(36),
    sub_type character varying(255)
);


ALTER TABLE public.component OWNER TO keycloak;

--
-- Name: component_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.component_config (
    id character varying(36) NOT NULL,
    component_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(4000)
);


ALTER TABLE public.component_config OWNER TO keycloak;

--
-- Name: composite_role; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.composite_role (
    composite character varying(36) NOT NULL,
    child_role character varying(36) NOT NULL
);


ALTER TABLE public.composite_role OWNER TO keycloak;

--
-- Name: credential; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.credential (
    id character varying(36) NOT NULL,
    salt bytea,
    type character varying(255),
    user_id character varying(36),
    created_date bigint,
    user_label character varying(255),
    secret_data text,
    credential_data text,
    priority integer
);


ALTER TABLE public.credential OWNER TO keycloak;

--
-- Name: databasechangelog; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.databasechangelog (
    id character varying(255) NOT NULL,
    author character varying(255) NOT NULL,
    filename character varying(255) NOT NULL,
    dateexecuted timestamp without time zone NOT NULL,
    orderexecuted integer NOT NULL,
    exectype character varying(10) NOT NULL,
    md5sum character varying(35),
    description character varying(255),
    comments character varying(255),
    tag character varying(255),
    liquibase character varying(20),
    contexts character varying(255),
    labels character varying(255),
    deployment_id character varying(10)
);


ALTER TABLE public.databasechangelog OWNER TO keycloak;

--
-- Name: databasechangeloglock; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.databasechangeloglock (
    id integer NOT NULL,
    locked boolean NOT NULL,
    lockgranted timestamp without time zone,
    lockedby character varying(255)
);


ALTER TABLE public.databasechangeloglock OWNER TO keycloak;

--
-- Name: default_client_scope; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.default_client_scope (
    realm_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL,
    default_scope boolean DEFAULT false NOT NULL
);


ALTER TABLE public.default_client_scope OWNER TO keycloak;

--
-- Name: event_entity; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.event_entity (
    id character varying(36) NOT NULL,
    client_id character varying(255),
    details_json character varying(2550),
    error character varying(255),
    ip_address character varying(255),
    realm_id character varying(255),
    session_id character varying(255),
    event_time bigint,
    type character varying(255),
    user_id character varying(255)
);


ALTER TABLE public.event_entity OWNER TO keycloak;

--
-- Name: fed_user_attribute; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.fed_user_attribute (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36),
    value character varying(2024)
);


ALTER TABLE public.fed_user_attribute OWNER TO keycloak;

--
-- Name: fed_user_consent; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.fed_user_consent (
    id character varying(36) NOT NULL,
    client_id character varying(255),
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36),
    created_date bigint,
    last_updated_date bigint,
    client_storage_provider character varying(36),
    external_client_id character varying(255)
);


ALTER TABLE public.fed_user_consent OWNER TO keycloak;

--
-- Name: fed_user_consent_cl_scope; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.fed_user_consent_cl_scope (
    user_consent_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL
);


ALTER TABLE public.fed_user_consent_cl_scope OWNER TO keycloak;

--
-- Name: fed_user_credential; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.fed_user_credential (
    id character varying(36) NOT NULL,
    salt bytea,
    type character varying(255),
    created_date bigint,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36),
    user_label character varying(255),
    secret_data text,
    credential_data text,
    priority integer
);


ALTER TABLE public.fed_user_credential OWNER TO keycloak;

--
-- Name: fed_user_group_membership; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.fed_user_group_membership (
    group_id character varying(36) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36)
);


ALTER TABLE public.fed_user_group_membership OWNER TO keycloak;

--
-- Name: fed_user_required_action; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.fed_user_required_action (
    required_action character varying(255) DEFAULT ' '::character varying NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36)
);


ALTER TABLE public.fed_user_required_action OWNER TO keycloak;

--
-- Name: fed_user_role_mapping; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.fed_user_role_mapping (
    role_id character varying(36) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36)
);


ALTER TABLE public.fed_user_role_mapping OWNER TO keycloak;

--
-- Name: federated_identity; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.federated_identity (
    identity_provider character varying(255) NOT NULL,
    realm_id character varying(36),
    federated_user_id character varying(255),
    federated_username character varying(255),
    token text,
    user_id character varying(36) NOT NULL
);


ALTER TABLE public.federated_identity OWNER TO keycloak;

--
-- Name: federated_user; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.federated_user (
    id character varying(255) NOT NULL,
    storage_provider_id character varying(255),
    realm_id character varying(36) NOT NULL
);


ALTER TABLE public.federated_user OWNER TO keycloak;

--
-- Name: group_attribute; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.group_attribute (
    id character varying(36) DEFAULT 'sybase-needs-something-here'::character varying NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(255),
    group_id character varying(36) NOT NULL
);


ALTER TABLE public.group_attribute OWNER TO keycloak;

--
-- Name: group_role_mapping; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.group_role_mapping (
    role_id character varying(36) NOT NULL,
    group_id character varying(36) NOT NULL
);


ALTER TABLE public.group_role_mapping OWNER TO keycloak;

--
-- Name: identity_provider; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.identity_provider (
    internal_id character varying(36) NOT NULL,
    enabled boolean DEFAULT false NOT NULL,
    provider_alias character varying(255),
    provider_id character varying(255),
    store_token boolean DEFAULT false NOT NULL,
    authenticate_by_default boolean DEFAULT false NOT NULL,
    realm_id character varying(36),
    add_token_role boolean DEFAULT true NOT NULL,
    trust_email boolean DEFAULT false NOT NULL,
    first_broker_login_flow_id character varying(36),
    post_broker_login_flow_id character varying(36),
    provider_display_name character varying(255),
    link_only boolean DEFAULT false NOT NULL
);


ALTER TABLE public.identity_provider OWNER TO keycloak;

--
-- Name: identity_provider_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.identity_provider_config (
    identity_provider_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.identity_provider_config OWNER TO keycloak;

--
-- Name: identity_provider_mapper; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.identity_provider_mapper (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    idp_alias character varying(255) NOT NULL,
    idp_mapper_name character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL
);


ALTER TABLE public.identity_provider_mapper OWNER TO keycloak;

--
-- Name: idp_mapper_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.idp_mapper_config (
    idp_mapper_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.idp_mapper_config OWNER TO keycloak;

--
-- Name: keycloak_group; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.keycloak_group (
    id character varying(36) NOT NULL,
    name character varying(255),
    parent_group character varying(36) NOT NULL,
    realm_id character varying(36)
);


ALTER TABLE public.keycloak_group OWNER TO keycloak;

--
-- Name: keycloak_role; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.keycloak_role (
    id character varying(36) NOT NULL,
    client_realm_constraint character varying(255),
    client_role boolean DEFAULT false NOT NULL,
    description character varying(255),
    name character varying(255),
    realm_id character varying(255),
    client character varying(36),
    realm character varying(36)
);


ALTER TABLE public.keycloak_role OWNER TO keycloak;

--
-- Name: migration_model; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.migration_model (
    id character varying(36) NOT NULL,
    version character varying(36),
    update_time bigint DEFAULT 0 NOT NULL
);


ALTER TABLE public.migration_model OWNER TO keycloak;

--
-- Name: offline_client_session; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.offline_client_session (
    user_session_id character varying(36) NOT NULL,
    client_id character varying(255) NOT NULL,
    offline_flag character varying(4) NOT NULL,
    "timestamp" integer,
    data text,
    client_storage_provider character varying(36) DEFAULT 'local'::character varying NOT NULL,
    external_client_id character varying(255) DEFAULT 'local'::character varying NOT NULL
);


ALTER TABLE public.offline_client_session OWNER TO keycloak;

--
-- Name: offline_user_session; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.offline_user_session (
    user_session_id character varying(36) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    created_on integer NOT NULL,
    offline_flag character varying(4) NOT NULL,
    data text,
    last_session_refresh integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.offline_user_session OWNER TO keycloak;

--
-- Name: policy_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.policy_config (
    policy_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value text
);


ALTER TABLE public.policy_config OWNER TO keycloak;

--
-- Name: protocol_mapper; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.protocol_mapper (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    protocol character varying(255) NOT NULL,
    protocol_mapper_name character varying(255) NOT NULL,
    client_id character varying(36),
    client_scope_id character varying(36)
);


ALTER TABLE public.protocol_mapper OWNER TO keycloak;

--
-- Name: protocol_mapper_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.protocol_mapper_config (
    protocol_mapper_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.protocol_mapper_config OWNER TO keycloak;

--
-- Name: realm; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.realm (
    id character varying(36) NOT NULL,
    access_code_lifespan integer,
    user_action_lifespan integer,
    access_token_lifespan integer,
    account_theme character varying(255),
    admin_theme character varying(255),
    email_theme character varying(255),
    enabled boolean DEFAULT false NOT NULL,
    events_enabled boolean DEFAULT false NOT NULL,
    events_expiration bigint,
    login_theme character varying(255),
    name character varying(255),
    not_before integer,
    password_policy character varying(2550),
    registration_allowed boolean DEFAULT false NOT NULL,
    remember_me boolean DEFAULT false NOT NULL,
    reset_password_allowed boolean DEFAULT false NOT NULL,
    social boolean DEFAULT false NOT NULL,
    ssl_required character varying(255),
    sso_idle_timeout integer,
    sso_max_lifespan integer,
    update_profile_on_soc_login boolean DEFAULT false NOT NULL,
    verify_email boolean DEFAULT false NOT NULL,
    master_admin_client character varying(36),
    login_lifespan integer,
    internationalization_enabled boolean DEFAULT false NOT NULL,
    default_locale character varying(255),
    reg_email_as_username boolean DEFAULT false NOT NULL,
    admin_events_enabled boolean DEFAULT false NOT NULL,
    admin_events_details_enabled boolean DEFAULT false NOT NULL,
    edit_username_allowed boolean DEFAULT false NOT NULL,
    otp_policy_counter integer DEFAULT 0,
    otp_policy_window integer DEFAULT 1,
    otp_policy_period integer DEFAULT 30,
    otp_policy_digits integer DEFAULT 6,
    otp_policy_alg character varying(36) DEFAULT 'HmacSHA1'::character varying,
    otp_policy_type character varying(36) DEFAULT 'totp'::character varying,
    browser_flow character varying(36),
    registration_flow character varying(36),
    direct_grant_flow character varying(36),
    reset_credentials_flow character varying(36),
    client_auth_flow character varying(36),
    offline_session_idle_timeout integer DEFAULT 0,
    revoke_refresh_token boolean DEFAULT false NOT NULL,
    access_token_life_implicit integer DEFAULT 0,
    login_with_email_allowed boolean DEFAULT true NOT NULL,
    duplicate_emails_allowed boolean DEFAULT false NOT NULL,
    docker_auth_flow character varying(36),
    refresh_token_max_reuse integer DEFAULT 0,
    allow_user_managed_access boolean DEFAULT false NOT NULL,
    sso_max_lifespan_remember_me integer DEFAULT 0 NOT NULL,
    sso_idle_timeout_remember_me integer DEFAULT 0 NOT NULL,
    default_role character varying(255)
);


ALTER TABLE public.realm OWNER TO keycloak;

--
-- Name: realm_attribute; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.realm_attribute (
    name character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    value text
);


ALTER TABLE public.realm_attribute OWNER TO keycloak;

--
-- Name: realm_default_groups; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.realm_default_groups (
    realm_id character varying(36) NOT NULL,
    group_id character varying(36) NOT NULL
);


ALTER TABLE public.realm_default_groups OWNER TO keycloak;

--
-- Name: realm_enabled_event_types; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.realm_enabled_event_types (
    realm_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.realm_enabled_event_types OWNER TO keycloak;

--
-- Name: realm_events_listeners; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.realm_events_listeners (
    realm_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.realm_events_listeners OWNER TO keycloak;

--
-- Name: realm_localizations; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.realm_localizations (
    realm_id character varying(255) NOT NULL,
    locale character varying(255) NOT NULL,
    texts text NOT NULL
);


ALTER TABLE public.realm_localizations OWNER TO keycloak;

--
-- Name: realm_required_credential; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.realm_required_credential (
    type character varying(255) NOT NULL,
    form_label character varying(255),
    input boolean DEFAULT false NOT NULL,
    secret boolean DEFAULT false NOT NULL,
    realm_id character varying(36) NOT NULL
);


ALTER TABLE public.realm_required_credential OWNER TO keycloak;

--
-- Name: realm_smtp_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.realm_smtp_config (
    realm_id character varying(36) NOT NULL,
    value character varying(255),
    name character varying(255) NOT NULL
);


ALTER TABLE public.realm_smtp_config OWNER TO keycloak;

--
-- Name: realm_supported_locales; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.realm_supported_locales (
    realm_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.realm_supported_locales OWNER TO keycloak;

--
-- Name: redirect_uris; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.redirect_uris (
    client_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.redirect_uris OWNER TO keycloak;

--
-- Name: required_action_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.required_action_config (
    required_action_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.required_action_config OWNER TO keycloak;

--
-- Name: required_action_provider; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.required_action_provider (
    id character varying(36) NOT NULL,
    alias character varying(255),
    name character varying(255),
    realm_id character varying(36),
    enabled boolean DEFAULT false NOT NULL,
    default_action boolean DEFAULT false NOT NULL,
    provider_id character varying(255),
    priority integer
);


ALTER TABLE public.required_action_provider OWNER TO keycloak;

--
-- Name: resource_attribute; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.resource_attribute (
    id character varying(36) DEFAULT 'sybase-needs-something-here'::character varying NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(255),
    resource_id character varying(36) NOT NULL
);


ALTER TABLE public.resource_attribute OWNER TO keycloak;

--
-- Name: resource_policy; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.resource_policy (
    resource_id character varying(36) NOT NULL,
    policy_id character varying(36) NOT NULL
);


ALTER TABLE public.resource_policy OWNER TO keycloak;

--
-- Name: resource_scope; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.resource_scope (
    resource_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL
);


ALTER TABLE public.resource_scope OWNER TO keycloak;

--
-- Name: resource_server; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.resource_server (
    id character varying(36) NOT NULL,
    allow_rs_remote_mgmt boolean DEFAULT false NOT NULL,
    policy_enforce_mode character varying(15) NOT NULL,
    decision_strategy smallint DEFAULT 1 NOT NULL
);


ALTER TABLE public.resource_server OWNER TO keycloak;

--
-- Name: resource_server_perm_ticket; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.resource_server_perm_ticket (
    id character varying(36) NOT NULL,
    owner character varying(255) NOT NULL,
    requester character varying(255) NOT NULL,
    created_timestamp bigint NOT NULL,
    granted_timestamp bigint,
    resource_id character varying(36) NOT NULL,
    scope_id character varying(36),
    resource_server_id character varying(36) NOT NULL,
    policy_id character varying(36)
);


ALTER TABLE public.resource_server_perm_ticket OWNER TO keycloak;

--
-- Name: resource_server_policy; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.resource_server_policy (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(255),
    type character varying(255) NOT NULL,
    decision_strategy character varying(20),
    logic character varying(20),
    resource_server_id character varying(36) NOT NULL,
    owner character varying(255)
);


ALTER TABLE public.resource_server_policy OWNER TO keycloak;

--
-- Name: resource_server_resource; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.resource_server_resource (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    type character varying(255),
    icon_uri character varying(255),
    owner character varying(255) NOT NULL,
    resource_server_id character varying(36) NOT NULL,
    owner_managed_access boolean DEFAULT false NOT NULL,
    display_name character varying(255)
);


ALTER TABLE public.resource_server_resource OWNER TO keycloak;

--
-- Name: resource_server_scope; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.resource_server_scope (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    icon_uri character varying(255),
    resource_server_id character varying(36) NOT NULL,
    display_name character varying(255)
);


ALTER TABLE public.resource_server_scope OWNER TO keycloak;

--
-- Name: resource_uris; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.resource_uris (
    resource_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.resource_uris OWNER TO keycloak;

--
-- Name: role_attribute; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.role_attribute (
    id character varying(36) NOT NULL,
    role_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(255)
);


ALTER TABLE public.role_attribute OWNER TO keycloak;

--
-- Name: scope_mapping; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.scope_mapping (
    client_id character varying(36) NOT NULL,
    role_id character varying(36) NOT NULL
);


ALTER TABLE public.scope_mapping OWNER TO keycloak;

--
-- Name: scope_policy; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.scope_policy (
    scope_id character varying(36) NOT NULL,
    policy_id character varying(36) NOT NULL
);


ALTER TABLE public.scope_policy OWNER TO keycloak;

--
-- Name: user_attribute; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_attribute (
    name character varying(255) NOT NULL,
    value character varying(255),
    user_id character varying(36) NOT NULL,
    id character varying(36) DEFAULT 'sybase-needs-something-here'::character varying NOT NULL
);


ALTER TABLE public.user_attribute OWNER TO keycloak;

--
-- Name: user_consent; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_consent (
    id character varying(36) NOT NULL,
    client_id character varying(255),
    user_id character varying(36) NOT NULL,
    created_date bigint,
    last_updated_date bigint,
    client_storage_provider character varying(36),
    external_client_id character varying(255)
);


ALTER TABLE public.user_consent OWNER TO keycloak;

--
-- Name: user_consent_client_scope; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_consent_client_scope (
    user_consent_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL
);


ALTER TABLE public.user_consent_client_scope OWNER TO keycloak;

--
-- Name: user_entity; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_entity (
    id character varying(36) NOT NULL,
    email character varying(255),
    email_constraint character varying(255),
    email_verified boolean DEFAULT false NOT NULL,
    enabled boolean DEFAULT false NOT NULL,
    federation_link character varying(255),
    first_name character varying(255),
    last_name character varying(255),
    realm_id character varying(255),
    username character varying(255),
    created_timestamp bigint,
    service_account_client_link character varying(255),
    not_before integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.user_entity OWNER TO keycloak;

--
-- Name: user_federation_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_federation_config (
    user_federation_provider_id character varying(36) NOT NULL,
    value character varying(255),
    name character varying(255) NOT NULL
);


ALTER TABLE public.user_federation_config OWNER TO keycloak;

--
-- Name: user_federation_mapper; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_federation_mapper (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    federation_provider_id character varying(36) NOT NULL,
    federation_mapper_type character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL
);


ALTER TABLE public.user_federation_mapper OWNER TO keycloak;

--
-- Name: user_federation_mapper_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_federation_mapper_config (
    user_federation_mapper_id character varying(36) NOT NULL,
    value character varying(255),
    name character varying(255) NOT NULL
);


ALTER TABLE public.user_federation_mapper_config OWNER TO keycloak;

--
-- Name: user_federation_provider; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_federation_provider (
    id character varying(36) NOT NULL,
    changed_sync_period integer,
    display_name character varying(255),
    full_sync_period integer,
    last_sync integer,
    priority integer,
    provider_name character varying(255),
    realm_id character varying(36)
);


ALTER TABLE public.user_federation_provider OWNER TO keycloak;

--
-- Name: user_group_membership; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_group_membership (
    group_id character varying(36) NOT NULL,
    user_id character varying(36) NOT NULL
);


ALTER TABLE public.user_group_membership OWNER TO keycloak;

--
-- Name: user_required_action; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_required_action (
    user_id character varying(36) NOT NULL,
    required_action character varying(255) DEFAULT ' '::character varying NOT NULL
);


ALTER TABLE public.user_required_action OWNER TO keycloak;

--
-- Name: user_role_mapping; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_role_mapping (
    role_id character varying(255) NOT NULL,
    user_id character varying(36) NOT NULL
);


ALTER TABLE public.user_role_mapping OWNER TO keycloak;

--
-- Name: user_session; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_session (
    id character varying(36) NOT NULL,
    auth_method character varying(255),
    ip_address character varying(255),
    last_session_refresh integer,
    login_username character varying(255),
    realm_id character varying(255),
    remember_me boolean DEFAULT false NOT NULL,
    started integer,
    user_id character varying(255),
    user_session_state integer,
    broker_session_id character varying(255),
    broker_user_id character varying(255)
);


ALTER TABLE public.user_session OWNER TO keycloak;

--
-- Name: user_session_note; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_session_note (
    user_session character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(2048)
);


ALTER TABLE public.user_session_note OWNER TO keycloak;

--
-- Name: username_login_failure; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.username_login_failure (
    realm_id character varying(36) NOT NULL,
    username character varying(255) NOT NULL,
    failed_login_not_before integer,
    last_failure bigint,
    last_ip_failure character varying(255),
    num_failures integer
);


ALTER TABLE public.username_login_failure OWNER TO keycloak;

--
-- Name: web_origins; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.web_origins (
    client_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.web_origins OWNER TO keycloak;

--
-- Data for Name: admin_event_entity; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.admin_event_entity (id, admin_event_time, realm_id, operation_type, auth_realm_id, auth_client_id, auth_user_id, ip_address, resource_path, representation, error, resource_type) FROM stdin;
\.


--
-- Data for Name: associated_policy; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.associated_policy (policy_id, associated_policy_id) FROM stdin;
\.


--
-- Data for Name: authentication_execution; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) FROM stdin;
3db8039e-fb2a-4b36-aafc-e7273d4fc57b	\N	auth-cookie	fd4a6218-c54d-4a98-bddb-08dba17ec4ef	57849afe-4024-421c-a37f-51ef41220726	2	10	f	\N	\N
d226cbb1-b23a-4c2b-9e6b-399f03da54ac	\N	auth-spnego	fd4a6218-c54d-4a98-bddb-08dba17ec4ef	57849afe-4024-421c-a37f-51ef41220726	3	20	f	\N	\N
06ab4f6a-5ed8-41ce-9431-58ead12af1a0	\N	identity-provider-redirector	fd4a6218-c54d-4a98-bddb-08dba17ec4ef	57849afe-4024-421c-a37f-51ef41220726	2	25	f	\N	\N
df84b752-c2a6-4bb0-bf9b-5022f5ae1d50	\N	\N	fd4a6218-c54d-4a98-bddb-08dba17ec4ef	57849afe-4024-421c-a37f-51ef41220726	2	30	t	86c5f9f6-5c6e-4358-85a1-d36ce1cc9df1	\N
615e47a8-17f4-4fe9-ac8c-c974cf97f50e	\N	auth-username-password-form	fd4a6218-c54d-4a98-bddb-08dba17ec4ef	86c5f9f6-5c6e-4358-85a1-d36ce1cc9df1	0	10	f	\N	\N
c3a30f9c-1fa0-4164-9dc9-83d547afaead	\N	\N	fd4a6218-c54d-4a98-bddb-08dba17ec4ef	86c5f9f6-5c6e-4358-85a1-d36ce1cc9df1	1	20	t	8041c207-d531-41bb-a2a1-750ae80e66c9	\N
1438e870-5349-4bf1-9038-cc35e22c7e03	\N	conditional-user-configured	fd4a6218-c54d-4a98-bddb-08dba17ec4ef	8041c207-d531-41bb-a2a1-750ae80e66c9	0	10	f	\N	\N
3c6789c7-d122-4fd4-94fc-6774d059ce18	\N	auth-otp-form	fd4a6218-c54d-4a98-bddb-08dba17ec4ef	8041c207-d531-41bb-a2a1-750ae80e66c9	0	20	f	\N	\N
8ed7854a-9ac4-41cc-906a-997953b068f6	\N	direct-grant-validate-username	fd4a6218-c54d-4a98-bddb-08dba17ec4ef	14b83cb2-f3dd-49f9-a8ab-59d9a1da0311	0	10	f	\N	\N
268c46ee-8c01-4fea-9ad6-a1f9484ccfb8	\N	direct-grant-validate-password	fd4a6218-c54d-4a98-bddb-08dba17ec4ef	14b83cb2-f3dd-49f9-a8ab-59d9a1da0311	0	20	f	\N	\N
561b102e-8888-4c2a-9bee-9caa683782f2	\N	\N	fd4a6218-c54d-4a98-bddb-08dba17ec4ef	14b83cb2-f3dd-49f9-a8ab-59d9a1da0311	1	30	t	20d710b6-4a1e-45b8-a8b2-bf1e4ab8680a	\N
5392c00c-2683-4c1d-939f-84354835551c	\N	conditional-user-configured	fd4a6218-c54d-4a98-bddb-08dba17ec4ef	20d710b6-4a1e-45b8-a8b2-bf1e4ab8680a	0	10	f	\N	\N
56a37cd3-ba25-4313-8f90-865b189f1209	\N	direct-grant-validate-otp	fd4a6218-c54d-4a98-bddb-08dba17ec4ef	20d710b6-4a1e-45b8-a8b2-bf1e4ab8680a	0	20	f	\N	\N
dce9108d-96aa-4a06-bb05-2d829b4b8695	\N	registration-page-form	fd4a6218-c54d-4a98-bddb-08dba17ec4ef	8e2b0be5-3ce2-4009-be38-558c4d9e700b	0	10	t	76848f0d-1360-4429-b7c1-51376f5f9dc9	\N
df8504e7-34ab-4ef4-a2ec-cbd7ef937923	\N	registration-user-creation	fd4a6218-c54d-4a98-bddb-08dba17ec4ef	76848f0d-1360-4429-b7c1-51376f5f9dc9	0	20	f	\N	\N
9f76837a-ac9c-4058-a898-2e138866a7ae	\N	registration-profile-action	fd4a6218-c54d-4a98-bddb-08dba17ec4ef	76848f0d-1360-4429-b7c1-51376f5f9dc9	0	40	f	\N	\N
33db8451-f179-4a18-9269-1c1a55c1987c	\N	registration-password-action	fd4a6218-c54d-4a98-bddb-08dba17ec4ef	76848f0d-1360-4429-b7c1-51376f5f9dc9	0	50	f	\N	\N
63a971fc-2744-4f88-a8b1-8af60cd1863c	\N	registration-recaptcha-action	fd4a6218-c54d-4a98-bddb-08dba17ec4ef	76848f0d-1360-4429-b7c1-51376f5f9dc9	3	60	f	\N	\N
8efd4c87-d43e-43cf-b8a0-51298701d7f3	\N	reset-credentials-choose-user	fd4a6218-c54d-4a98-bddb-08dba17ec4ef	dba02a39-f951-4856-9023-e468e3afd31f	0	10	f	\N	\N
f90b019b-7b05-4d97-893f-ec3abe5ceb0a	\N	reset-credential-email	fd4a6218-c54d-4a98-bddb-08dba17ec4ef	dba02a39-f951-4856-9023-e468e3afd31f	0	20	f	\N	\N
2b9872f6-f99c-44ed-9a9e-b07df5ba122e	\N	reset-password	fd4a6218-c54d-4a98-bddb-08dba17ec4ef	dba02a39-f951-4856-9023-e468e3afd31f	0	30	f	\N	\N
f9379576-9ae0-405b-a139-3670edc9e594	\N	\N	fd4a6218-c54d-4a98-bddb-08dba17ec4ef	dba02a39-f951-4856-9023-e468e3afd31f	1	40	t	26d6f354-f4cc-491f-a95b-8a788724113c	\N
cf16fd96-c65c-4412-9cdf-b20928fe55d2	\N	conditional-user-configured	fd4a6218-c54d-4a98-bddb-08dba17ec4ef	26d6f354-f4cc-491f-a95b-8a788724113c	0	10	f	\N	\N
7a60e0a9-3e29-465e-a75e-3a4276a44904	\N	reset-otp	fd4a6218-c54d-4a98-bddb-08dba17ec4ef	26d6f354-f4cc-491f-a95b-8a788724113c	0	20	f	\N	\N
74ebec62-dd31-47b7-98d2-40cffdd9bb2a	\N	client-secret	fd4a6218-c54d-4a98-bddb-08dba17ec4ef	77058134-fd7b-4e6a-9a1a-ca15f95053db	2	10	f	\N	\N
14ae9fa9-d09e-41ed-9edf-eb946f5c30b2	\N	client-jwt	fd4a6218-c54d-4a98-bddb-08dba17ec4ef	77058134-fd7b-4e6a-9a1a-ca15f95053db	2	20	f	\N	\N
d8436add-bed5-4d25-810a-c43496c6322b	\N	client-secret-jwt	fd4a6218-c54d-4a98-bddb-08dba17ec4ef	77058134-fd7b-4e6a-9a1a-ca15f95053db	2	30	f	\N	\N
fb4ac3e5-8477-49ac-b0f7-1065e62e43ea	\N	client-x509	fd4a6218-c54d-4a98-bddb-08dba17ec4ef	77058134-fd7b-4e6a-9a1a-ca15f95053db	2	40	f	\N	\N
e8ac05ee-21dc-47a6-8734-e56c9b430995	\N	idp-review-profile	fd4a6218-c54d-4a98-bddb-08dba17ec4ef	e5a17608-1f7b-4d68-bb1c-8b91ceb10add	0	10	f	\N	8b37ee32-e17c-46c7-b955-6b34c2fc9597
acaa3a24-40c1-451a-b2d2-15c10b5730ec	\N	\N	fd4a6218-c54d-4a98-bddb-08dba17ec4ef	e5a17608-1f7b-4d68-bb1c-8b91ceb10add	0	20	t	91a3fcf9-5801-4271-9963-8044b596d12f	\N
0b08bca2-5c45-40c7-bb9b-3baeaee8409c	\N	idp-create-user-if-unique	fd4a6218-c54d-4a98-bddb-08dba17ec4ef	91a3fcf9-5801-4271-9963-8044b596d12f	2	10	f	\N	32f81031-df9b-4716-aaf2-f8ed8d4804e7
290baa5b-52b7-4201-a19e-f178961fad9d	\N	\N	fd4a6218-c54d-4a98-bddb-08dba17ec4ef	91a3fcf9-5801-4271-9963-8044b596d12f	2	20	t	122172f8-f2a9-4e3f-aa43-d856870a2519	\N
03e0fe6d-88eb-47a7-a131-ab50d4fe1364	\N	idp-confirm-link	fd4a6218-c54d-4a98-bddb-08dba17ec4ef	122172f8-f2a9-4e3f-aa43-d856870a2519	0	10	f	\N	\N
7dc5312d-f1d3-4fef-bdbe-f3b89bc1c4c1	\N	\N	fd4a6218-c54d-4a98-bddb-08dba17ec4ef	122172f8-f2a9-4e3f-aa43-d856870a2519	0	20	t	21e0531f-f63b-4cb6-98e0-ac6b7226ae28	\N
ce2315f3-36c3-4830-bd83-f07537ec81c2	\N	idp-email-verification	fd4a6218-c54d-4a98-bddb-08dba17ec4ef	21e0531f-f63b-4cb6-98e0-ac6b7226ae28	2	10	f	\N	\N
182ec2ea-27f5-4cc5-89b7-7a4a0df456d8	\N	\N	fd4a6218-c54d-4a98-bddb-08dba17ec4ef	21e0531f-f63b-4cb6-98e0-ac6b7226ae28	2	20	t	e0adc451-25a6-4e33-9e99-9dec8e791bf9	\N
3821c860-54fb-4f87-8dca-d8599710772c	\N	idp-username-password-form	fd4a6218-c54d-4a98-bddb-08dba17ec4ef	e0adc451-25a6-4e33-9e99-9dec8e791bf9	0	10	f	\N	\N
aee33c26-0074-440a-b5a9-096f1d7cf9bd	\N	\N	fd4a6218-c54d-4a98-bddb-08dba17ec4ef	e0adc451-25a6-4e33-9e99-9dec8e791bf9	1	20	t	4c71fe77-e3b5-44c0-8791-70f105118c93	\N
e2da0be4-0844-4515-869b-43f42cff5015	\N	conditional-user-configured	fd4a6218-c54d-4a98-bddb-08dba17ec4ef	4c71fe77-e3b5-44c0-8791-70f105118c93	0	10	f	\N	\N
2f8e065d-c74d-4be3-a004-89e3d35d3b0b	\N	auth-otp-form	fd4a6218-c54d-4a98-bddb-08dba17ec4ef	4c71fe77-e3b5-44c0-8791-70f105118c93	0	20	f	\N	\N
a3437d01-0386-4d35-bac4-f599f4cc5204	\N	http-basic-authenticator	fd4a6218-c54d-4a98-bddb-08dba17ec4ef	def9a2ee-e4e0-4791-92ab-502046571bb0	0	10	f	\N	\N
a50fedaa-28db-4850-b215-bbe6afad11a3	\N	docker-http-basic-authenticator	fd4a6218-c54d-4a98-bddb-08dba17ec4ef	cdcaa89c-b836-4b9d-8d01-ead9b75dea72	0	10	f	\N	\N
029cdafa-3091-4a59-8278-a5f54bb1155e	\N	no-cookie-redirect	fd4a6218-c54d-4a98-bddb-08dba17ec4ef	0f81a32e-cd8f-4a93-9b46-27e51d2724c7	0	10	f	\N	\N
f6f64220-2f69-4424-b62f-0cfdcfaec0ed	\N	\N	fd4a6218-c54d-4a98-bddb-08dba17ec4ef	0f81a32e-cd8f-4a93-9b46-27e51d2724c7	0	20	t	0bf6046a-97fb-4006-b1ed-0533aae159db	\N
7f17762f-3722-4f7a-b860-0e80ef41faec	\N	basic-auth	fd4a6218-c54d-4a98-bddb-08dba17ec4ef	0bf6046a-97fb-4006-b1ed-0533aae159db	0	10	f	\N	\N
5315ab8e-49aa-4a8e-a780-7a130c9f55a0	\N	basic-auth-otp	fd4a6218-c54d-4a98-bddb-08dba17ec4ef	0bf6046a-97fb-4006-b1ed-0533aae159db	3	20	f	\N	\N
a4cc6fd3-241d-41a2-a47a-55998a1ded33	\N	auth-spnego	fd4a6218-c54d-4a98-bddb-08dba17ec4ef	0bf6046a-97fb-4006-b1ed-0533aae159db	3	30	f	\N	\N
321abcf3-b1ff-4547-8ad4-242de9a50977	\N	auth-cookie	a5069552-e930-4472-8a7f-facf76e3e7f5	4535e69b-2039-40ea-b561-33a8c814ff87	2	10	f	\N	\N
15422a73-ee0a-4409-b14a-ed848eadd5d9	\N	auth-spnego	a5069552-e930-4472-8a7f-facf76e3e7f5	4535e69b-2039-40ea-b561-33a8c814ff87	3	20	f	\N	\N
2030e2b8-6233-415f-bead-e801c8e9b1de	\N	identity-provider-redirector	a5069552-e930-4472-8a7f-facf76e3e7f5	4535e69b-2039-40ea-b561-33a8c814ff87	2	25	f	\N	\N
09a19a32-93b8-4952-a3fc-023ade40cd82	\N	\N	a5069552-e930-4472-8a7f-facf76e3e7f5	4535e69b-2039-40ea-b561-33a8c814ff87	2	30	t	dc147150-3c9b-4c69-8552-934df6367da2	\N
607f21a8-4619-41da-930b-21cd8933a91c	\N	auth-username-password-form	a5069552-e930-4472-8a7f-facf76e3e7f5	dc147150-3c9b-4c69-8552-934df6367da2	0	10	f	\N	\N
f7a1654e-e054-4128-b65a-a1c42fa86016	\N	\N	a5069552-e930-4472-8a7f-facf76e3e7f5	dc147150-3c9b-4c69-8552-934df6367da2	1	20	t	69f8b3a6-c041-4000-a41e-37734916be3b	\N
aca7c080-858d-49ab-b9e6-ce2b16498bfa	\N	conditional-user-configured	a5069552-e930-4472-8a7f-facf76e3e7f5	69f8b3a6-c041-4000-a41e-37734916be3b	0	10	f	\N	\N
6f63329b-0def-432a-9136-65d40c60d9b4	\N	auth-otp-form	a5069552-e930-4472-8a7f-facf76e3e7f5	69f8b3a6-c041-4000-a41e-37734916be3b	0	20	f	\N	\N
33facd1a-b7b6-44dc-aa04-e3b36bb5f36c	\N	direct-grant-validate-username	a5069552-e930-4472-8a7f-facf76e3e7f5	bd5f140a-ceac-41d7-b50c-8f47c3610bb7	0	10	f	\N	\N
e2b7eba2-4431-4abb-af0b-67e1d73d626e	\N	direct-grant-validate-password	a5069552-e930-4472-8a7f-facf76e3e7f5	bd5f140a-ceac-41d7-b50c-8f47c3610bb7	0	20	f	\N	\N
29580abe-240c-443f-81f0-c33aa6b5ec00	\N	\N	a5069552-e930-4472-8a7f-facf76e3e7f5	bd5f140a-ceac-41d7-b50c-8f47c3610bb7	1	30	t	6dfe2836-2751-4db8-acf3-b34ce50a1a24	\N
1c1ddc38-9ccb-4b4f-8867-b2c3ef163cc7	\N	conditional-user-configured	a5069552-e930-4472-8a7f-facf76e3e7f5	6dfe2836-2751-4db8-acf3-b34ce50a1a24	0	10	f	\N	\N
7349e387-715a-4d71-b745-5dca67a12f13	\N	direct-grant-validate-otp	a5069552-e930-4472-8a7f-facf76e3e7f5	6dfe2836-2751-4db8-acf3-b34ce50a1a24	0	20	f	\N	\N
0a2b4b62-476d-4aa0-b36b-fb8da85cab4d	\N	registration-page-form	a5069552-e930-4472-8a7f-facf76e3e7f5	0e104e0f-5ceb-4daa-96d1-5cb875b8e542	0	10	t	e8f30890-8991-4fd7-887e-dc6ff2ab276a	\N
6e9ee91d-c804-43eb-8039-d88633ba8ba8	\N	registration-user-creation	a5069552-e930-4472-8a7f-facf76e3e7f5	e8f30890-8991-4fd7-887e-dc6ff2ab276a	0	20	f	\N	\N
e755ad73-c0a7-40eb-9901-d90fcb534817	\N	registration-profile-action	a5069552-e930-4472-8a7f-facf76e3e7f5	e8f30890-8991-4fd7-887e-dc6ff2ab276a	0	40	f	\N	\N
24a096a2-b6fa-416b-a010-ba4adbfee216	\N	registration-password-action	a5069552-e930-4472-8a7f-facf76e3e7f5	e8f30890-8991-4fd7-887e-dc6ff2ab276a	0	50	f	\N	\N
7db3ed0b-3548-4288-8a2d-cb4cf82efe48	\N	registration-recaptcha-action	a5069552-e930-4472-8a7f-facf76e3e7f5	e8f30890-8991-4fd7-887e-dc6ff2ab276a	3	60	f	\N	\N
f7c847f9-6387-4f3a-a666-2384e22bbe69	\N	reset-credentials-choose-user	a5069552-e930-4472-8a7f-facf76e3e7f5	d27f4f65-302f-44d4-b875-dfd97f4068d4	0	10	f	\N	\N
f161f923-5fcc-498f-98ad-cd8b1c4cce8a	\N	reset-credential-email	a5069552-e930-4472-8a7f-facf76e3e7f5	d27f4f65-302f-44d4-b875-dfd97f4068d4	0	20	f	\N	\N
ba7c255a-6745-4b36-8852-32a344cd1deb	\N	reset-password	a5069552-e930-4472-8a7f-facf76e3e7f5	d27f4f65-302f-44d4-b875-dfd97f4068d4	0	30	f	\N	\N
150ada0c-274e-460e-bf30-5c4e2fa1f270	\N	\N	a5069552-e930-4472-8a7f-facf76e3e7f5	d27f4f65-302f-44d4-b875-dfd97f4068d4	1	40	t	cb221cf9-b87e-4d02-b047-6c4b7798411f	\N
9a8e6d35-9c6f-4cd0-b3e5-b407789dd403	\N	conditional-user-configured	a5069552-e930-4472-8a7f-facf76e3e7f5	cb221cf9-b87e-4d02-b047-6c4b7798411f	0	10	f	\N	\N
7543618a-cec5-407f-a4a6-6dab01675e47	\N	reset-otp	a5069552-e930-4472-8a7f-facf76e3e7f5	cb221cf9-b87e-4d02-b047-6c4b7798411f	0	20	f	\N	\N
f11ad116-e857-41a4-9567-5d8189490b59	\N	client-secret	a5069552-e930-4472-8a7f-facf76e3e7f5	4ab383a9-5354-4e93-8050-acb9f3e36fa0	2	10	f	\N	\N
f1520ce3-39ff-4fc6-a2c8-0e268397332f	\N	client-jwt	a5069552-e930-4472-8a7f-facf76e3e7f5	4ab383a9-5354-4e93-8050-acb9f3e36fa0	2	20	f	\N	\N
be6bf53e-bbdf-42fa-8abd-8549b42f4cb1	\N	client-secret-jwt	a5069552-e930-4472-8a7f-facf76e3e7f5	4ab383a9-5354-4e93-8050-acb9f3e36fa0	2	30	f	\N	\N
d0912f97-9309-411e-8a3b-56142dafd014	\N	client-x509	a5069552-e930-4472-8a7f-facf76e3e7f5	4ab383a9-5354-4e93-8050-acb9f3e36fa0	2	40	f	\N	\N
d11c3114-b79f-4b30-a71e-4a666e028f82	\N	idp-review-profile	a5069552-e930-4472-8a7f-facf76e3e7f5	79184e5a-1aee-4c4d-9490-c044d8478c2e	0	10	f	\N	be9c04d0-ec08-409e-81db-889df1adce69
7f026a51-95e0-4566-a806-b1a12c7501c4	\N	\N	a5069552-e930-4472-8a7f-facf76e3e7f5	79184e5a-1aee-4c4d-9490-c044d8478c2e	0	20	t	30815002-e4ad-49b4-9d20-409c06e2ca98	\N
dd8e31ad-a3d6-4b5a-a4b7-734c4a4a2526	\N	idp-create-user-if-unique	a5069552-e930-4472-8a7f-facf76e3e7f5	30815002-e4ad-49b4-9d20-409c06e2ca98	2	10	f	\N	8626d1b9-ad0f-4ca5-b113-a272b3be8360
2db7b7f1-dc19-4305-9532-cc3e16b20c15	\N	\N	a5069552-e930-4472-8a7f-facf76e3e7f5	30815002-e4ad-49b4-9d20-409c06e2ca98	2	20	t	8794220d-2240-4ab5-9139-929b26ff56f4	\N
b39865bb-13c2-48f3-a17e-dfcc962ceb72	\N	idp-confirm-link	a5069552-e930-4472-8a7f-facf76e3e7f5	8794220d-2240-4ab5-9139-929b26ff56f4	0	10	f	\N	\N
4628a880-d24b-478c-ac90-0d6fa4fe1d58	\N	\N	a5069552-e930-4472-8a7f-facf76e3e7f5	8794220d-2240-4ab5-9139-929b26ff56f4	0	20	t	de19354b-e385-432a-9f10-a3138ce4c8f1	\N
c978e302-7e33-4e2b-9dbf-11d5cc350c39	\N	idp-email-verification	a5069552-e930-4472-8a7f-facf76e3e7f5	de19354b-e385-432a-9f10-a3138ce4c8f1	2	10	f	\N	\N
0c36b0b5-7a2e-4e64-b547-bb9009c1fef0	\N	\N	a5069552-e930-4472-8a7f-facf76e3e7f5	de19354b-e385-432a-9f10-a3138ce4c8f1	2	20	t	21f033cc-bb16-4dc9-b405-d0709777eacf	\N
3effa1f6-d516-439f-b8aa-6a6ca54c82f7	\N	idp-username-password-form	a5069552-e930-4472-8a7f-facf76e3e7f5	21f033cc-bb16-4dc9-b405-d0709777eacf	0	10	f	\N	\N
d3451a2d-5bd9-487d-8401-8d1acce6dc23	\N	\N	a5069552-e930-4472-8a7f-facf76e3e7f5	21f033cc-bb16-4dc9-b405-d0709777eacf	1	20	t	44478ffe-634f-4a93-ac76-fc1ad196d47c	\N
7d8a7463-2ee3-4ad6-8985-ad9b09cd00b1	\N	conditional-user-configured	a5069552-e930-4472-8a7f-facf76e3e7f5	44478ffe-634f-4a93-ac76-fc1ad196d47c	0	10	f	\N	\N
3fbc9821-61ce-4072-a93c-8888b7b03830	\N	auth-otp-form	a5069552-e930-4472-8a7f-facf76e3e7f5	44478ffe-634f-4a93-ac76-fc1ad196d47c	0	20	f	\N	\N
18ff4b5c-a607-4f97-942a-05ba463d7e4e	\N	http-basic-authenticator	a5069552-e930-4472-8a7f-facf76e3e7f5	8e50e663-e839-435f-8a0d-894be629a13a	0	10	f	\N	\N
866b6056-498b-459a-8711-9de89f82b20b	\N	docker-http-basic-authenticator	a5069552-e930-4472-8a7f-facf76e3e7f5	a237a83d-5155-4fb0-8d3b-4de114f5fa45	0	10	f	\N	\N
63ef79bf-6107-4812-9933-1bb63be6a628	\N	no-cookie-redirect	a5069552-e930-4472-8a7f-facf76e3e7f5	19b7333b-d98f-4e2e-a739-f7b86cafc518	0	10	f	\N	\N
397cfdb6-f848-4d86-a5eb-dbc1f94a5172	\N	\N	a5069552-e930-4472-8a7f-facf76e3e7f5	19b7333b-d98f-4e2e-a739-f7b86cafc518	0	20	t	57eafa2c-488a-4986-8145-713411eeb403	\N
811297c0-5741-4f34-8649-9af0386ce347	\N	basic-auth	a5069552-e930-4472-8a7f-facf76e3e7f5	57eafa2c-488a-4986-8145-713411eeb403	0	10	f	\N	\N
91341f58-5eac-4487-bafd-8e29a6e9de95	\N	basic-auth-otp	a5069552-e930-4472-8a7f-facf76e3e7f5	57eafa2c-488a-4986-8145-713411eeb403	3	20	f	\N	\N
dc3f2e75-6fd0-4421-8a8f-9b74936c6da2	\N	auth-spnego	a5069552-e930-4472-8a7f-facf76e3e7f5	57eafa2c-488a-4986-8145-713411eeb403	3	30	f	\N	\N
\.


--
-- Data for Name: authentication_flow; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) FROM stdin;
57849afe-4024-421c-a37f-51ef41220726	browser	browser based authentication	fd4a6218-c54d-4a98-bddb-08dba17ec4ef	basic-flow	t	t
86c5f9f6-5c6e-4358-85a1-d36ce1cc9df1	forms	Username, password, otp and other auth forms.	fd4a6218-c54d-4a98-bddb-08dba17ec4ef	basic-flow	f	t
8041c207-d531-41bb-a2a1-750ae80e66c9	Browser - Conditional OTP	Flow to determine if the OTP is required for the authentication	fd4a6218-c54d-4a98-bddb-08dba17ec4ef	basic-flow	f	t
14b83cb2-f3dd-49f9-a8ab-59d9a1da0311	direct grant	OpenID Connect Resource Owner Grant	fd4a6218-c54d-4a98-bddb-08dba17ec4ef	basic-flow	t	t
20d710b6-4a1e-45b8-a8b2-bf1e4ab8680a	Direct Grant - Conditional OTP	Flow to determine if the OTP is required for the authentication	fd4a6218-c54d-4a98-bddb-08dba17ec4ef	basic-flow	f	t
8e2b0be5-3ce2-4009-be38-558c4d9e700b	registration	registration flow	fd4a6218-c54d-4a98-bddb-08dba17ec4ef	basic-flow	t	t
76848f0d-1360-4429-b7c1-51376f5f9dc9	registration form	registration form	fd4a6218-c54d-4a98-bddb-08dba17ec4ef	form-flow	f	t
dba02a39-f951-4856-9023-e468e3afd31f	reset credentials	Reset credentials for a user if they forgot their password or something	fd4a6218-c54d-4a98-bddb-08dba17ec4ef	basic-flow	t	t
26d6f354-f4cc-491f-a95b-8a788724113c	Reset - Conditional OTP	Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.	fd4a6218-c54d-4a98-bddb-08dba17ec4ef	basic-flow	f	t
77058134-fd7b-4e6a-9a1a-ca15f95053db	clients	Base authentication for clients	fd4a6218-c54d-4a98-bddb-08dba17ec4ef	client-flow	t	t
e5a17608-1f7b-4d68-bb1c-8b91ceb10add	first broker login	Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account	fd4a6218-c54d-4a98-bddb-08dba17ec4ef	basic-flow	t	t
91a3fcf9-5801-4271-9963-8044b596d12f	User creation or linking	Flow for the existing/non-existing user alternatives	fd4a6218-c54d-4a98-bddb-08dba17ec4ef	basic-flow	f	t
122172f8-f2a9-4e3f-aa43-d856870a2519	Handle Existing Account	Handle what to do if there is existing account with same email/username like authenticated identity provider	fd4a6218-c54d-4a98-bddb-08dba17ec4ef	basic-flow	f	t
21e0531f-f63b-4cb6-98e0-ac6b7226ae28	Account verification options	Method with which to verity the existing account	fd4a6218-c54d-4a98-bddb-08dba17ec4ef	basic-flow	f	t
e0adc451-25a6-4e33-9e99-9dec8e791bf9	Verify Existing Account by Re-authentication	Reauthentication of existing account	fd4a6218-c54d-4a98-bddb-08dba17ec4ef	basic-flow	f	t
4c71fe77-e3b5-44c0-8791-70f105118c93	First broker login - Conditional OTP	Flow to determine if the OTP is required for the authentication	fd4a6218-c54d-4a98-bddb-08dba17ec4ef	basic-flow	f	t
def9a2ee-e4e0-4791-92ab-502046571bb0	saml ecp	SAML ECP Profile Authentication Flow	fd4a6218-c54d-4a98-bddb-08dba17ec4ef	basic-flow	t	t
cdcaa89c-b836-4b9d-8d01-ead9b75dea72	docker auth	Used by Docker clients to authenticate against the IDP	fd4a6218-c54d-4a98-bddb-08dba17ec4ef	basic-flow	t	t
0f81a32e-cd8f-4a93-9b46-27e51d2724c7	http challenge	An authentication flow based on challenge-response HTTP Authentication Schemes	fd4a6218-c54d-4a98-bddb-08dba17ec4ef	basic-flow	t	t
0bf6046a-97fb-4006-b1ed-0533aae159db	Authentication Options	Authentication options.	fd4a6218-c54d-4a98-bddb-08dba17ec4ef	basic-flow	f	t
4535e69b-2039-40ea-b561-33a8c814ff87	browser	browser based authentication	a5069552-e930-4472-8a7f-facf76e3e7f5	basic-flow	t	t
dc147150-3c9b-4c69-8552-934df6367da2	forms	Username, password, otp and other auth forms.	a5069552-e930-4472-8a7f-facf76e3e7f5	basic-flow	f	t
69f8b3a6-c041-4000-a41e-37734916be3b	Browser - Conditional OTP	Flow to determine if the OTP is required for the authentication	a5069552-e930-4472-8a7f-facf76e3e7f5	basic-flow	f	t
bd5f140a-ceac-41d7-b50c-8f47c3610bb7	direct grant	OpenID Connect Resource Owner Grant	a5069552-e930-4472-8a7f-facf76e3e7f5	basic-flow	t	t
6dfe2836-2751-4db8-acf3-b34ce50a1a24	Direct Grant - Conditional OTP	Flow to determine if the OTP is required for the authentication	a5069552-e930-4472-8a7f-facf76e3e7f5	basic-flow	f	t
0e104e0f-5ceb-4daa-96d1-5cb875b8e542	registration	registration flow	a5069552-e930-4472-8a7f-facf76e3e7f5	basic-flow	t	t
e8f30890-8991-4fd7-887e-dc6ff2ab276a	registration form	registration form	a5069552-e930-4472-8a7f-facf76e3e7f5	form-flow	f	t
d27f4f65-302f-44d4-b875-dfd97f4068d4	reset credentials	Reset credentials for a user if they forgot their password or something	a5069552-e930-4472-8a7f-facf76e3e7f5	basic-flow	t	t
cb221cf9-b87e-4d02-b047-6c4b7798411f	Reset - Conditional OTP	Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.	a5069552-e930-4472-8a7f-facf76e3e7f5	basic-flow	f	t
4ab383a9-5354-4e93-8050-acb9f3e36fa0	clients	Base authentication for clients	a5069552-e930-4472-8a7f-facf76e3e7f5	client-flow	t	t
79184e5a-1aee-4c4d-9490-c044d8478c2e	first broker login	Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account	a5069552-e930-4472-8a7f-facf76e3e7f5	basic-flow	t	t
30815002-e4ad-49b4-9d20-409c06e2ca98	User creation or linking	Flow for the existing/non-existing user alternatives	a5069552-e930-4472-8a7f-facf76e3e7f5	basic-flow	f	t
8794220d-2240-4ab5-9139-929b26ff56f4	Handle Existing Account	Handle what to do if there is existing account with same email/username like authenticated identity provider	a5069552-e930-4472-8a7f-facf76e3e7f5	basic-flow	f	t
de19354b-e385-432a-9f10-a3138ce4c8f1	Account verification options	Method with which to verity the existing account	a5069552-e930-4472-8a7f-facf76e3e7f5	basic-flow	f	t
21f033cc-bb16-4dc9-b405-d0709777eacf	Verify Existing Account by Re-authentication	Reauthentication of existing account	a5069552-e930-4472-8a7f-facf76e3e7f5	basic-flow	f	t
44478ffe-634f-4a93-ac76-fc1ad196d47c	First broker login - Conditional OTP	Flow to determine if the OTP is required for the authentication	a5069552-e930-4472-8a7f-facf76e3e7f5	basic-flow	f	t
8e50e663-e839-435f-8a0d-894be629a13a	saml ecp	SAML ECP Profile Authentication Flow	a5069552-e930-4472-8a7f-facf76e3e7f5	basic-flow	t	t
a237a83d-5155-4fb0-8d3b-4de114f5fa45	docker auth	Used by Docker clients to authenticate against the IDP	a5069552-e930-4472-8a7f-facf76e3e7f5	basic-flow	t	t
19b7333b-d98f-4e2e-a739-f7b86cafc518	http challenge	An authentication flow based on challenge-response HTTP Authentication Schemes	a5069552-e930-4472-8a7f-facf76e3e7f5	basic-flow	t	t
57eafa2c-488a-4986-8145-713411eeb403	Authentication Options	Authentication options.	a5069552-e930-4472-8a7f-facf76e3e7f5	basic-flow	f	t
\.


--
-- Data for Name: authenticator_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.authenticator_config (id, alias, realm_id) FROM stdin;
8b37ee32-e17c-46c7-b955-6b34c2fc9597	review profile config	fd4a6218-c54d-4a98-bddb-08dba17ec4ef
32f81031-df9b-4716-aaf2-f8ed8d4804e7	create unique user config	fd4a6218-c54d-4a98-bddb-08dba17ec4ef
be9c04d0-ec08-409e-81db-889df1adce69	review profile config	a5069552-e930-4472-8a7f-facf76e3e7f5
8626d1b9-ad0f-4ca5-b113-a272b3be8360	create unique user config	a5069552-e930-4472-8a7f-facf76e3e7f5
\.


--
-- Data for Name: authenticator_config_entry; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.authenticator_config_entry (authenticator_id, value, name) FROM stdin;
32f81031-df9b-4716-aaf2-f8ed8d4804e7	false	require.password.update.after.registration
8b37ee32-e17c-46c7-b955-6b34c2fc9597	missing	update.profile.on.first.login
8626d1b9-ad0f-4ca5-b113-a272b3be8360	false	require.password.update.after.registration
be9c04d0-ec08-409e-81db-889df1adce69	missing	update.profile.on.first.login
\.


--
-- Data for Name: broker_link; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.broker_link (identity_provider, storage_provider_id, realm_id, broker_user_id, broker_username, token, user_id) FROM stdin;
\.


--
-- Data for Name: client; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client (id, enabled, full_scope_allowed, client_id, not_before, public_client, secret, base_url, bearer_only, management_url, surrogate_auth_required, realm_id, protocol, node_rereg_timeout, frontchannel_logout, consent_required, name, service_accounts_enabled, client_authenticator_type, root_url, description, registration_token, standard_flow_enabled, implicit_flow_enabled, direct_access_grants_enabled, always_display_in_console) FROM stdin;
20a47e58-c362-40ef-ba05-16037dbaf30e	t	f	master-realm	0	f	\N	\N	t	\N	f	fd4a6218-c54d-4a98-bddb-08dba17ec4ef	\N	0	f	f	master Realm	f	client-secret	\N	\N	\N	t	f	f	f
cccb0307-df62-466f-a9f0-3813069d9c6c	t	f	account	0	t	\N	/realms/master/account/	f	\N	f	fd4a6218-c54d-4a98-bddb-08dba17ec4ef	openid-connect	0	f	f	${client_account}	f	client-secret	${authBaseUrl}	\N	\N	t	f	f	f
89edf3fc-ecca-4425-a996-45dd9e45834d	t	f	account-console	0	t	\N	/realms/master/account/	f	\N	f	fd4a6218-c54d-4a98-bddb-08dba17ec4ef	openid-connect	0	f	f	${client_account-console}	f	client-secret	${authBaseUrl}	\N	\N	t	f	f	f
381c4fa8-47ee-4b0e-b5b2-0cfb99e7f168	t	f	broker	0	f	\N	\N	t	\N	f	fd4a6218-c54d-4a98-bddb-08dba17ec4ef	openid-connect	0	f	f	${client_broker}	f	client-secret	\N	\N	\N	t	f	f	f
42f58925-9b32-4d59-8fb3-f9ec959c68ae	t	f	security-admin-console	0	t	\N	/admin/master/console/	f	\N	f	fd4a6218-c54d-4a98-bddb-08dba17ec4ef	openid-connect	0	f	f	${client_security-admin-console}	f	client-secret	${authAdminUrl}	\N	\N	t	f	f	f
c8dbb960-4dfc-4acf-b3e8-29906a6eb8e1	t	f	admin-cli	0	t	\N	\N	f	\N	f	fd4a6218-c54d-4a98-bddb-08dba17ec4ef	openid-connect	0	f	f	${client_admin-cli}	f	client-secret	\N	\N	\N	f	f	t	f
9c38e015-a478-4c19-ab1a-0818711f31c4	t	f	benchmark-realm	0	f	\N	\N	t	\N	f	fd4a6218-c54d-4a98-bddb-08dba17ec4ef	\N	0	f	f	benchmark Realm	f	client-secret	\N	\N	\N	t	f	f	f
9db59d89-b318-48a4-8def-abec5b60607c	t	f	realm-management	0	f	\N	\N	t	\N	f	a5069552-e930-4472-8a7f-facf76e3e7f5	openid-connect	0	f	f	${client_realm-management}	f	client-secret	\N	\N	\N	t	f	f	f
c8389924-e7d6-4232-b74d-de63f8d43745	t	f	account	0	t	\N	/realms/benchmark/account/	f	\N	f	a5069552-e930-4472-8a7f-facf76e3e7f5	openid-connect	0	f	f	${client_account}	f	client-secret	${authBaseUrl}	\N	\N	t	f	f	f
6b5f11f3-9d21-4984-b7b1-5eb23612e671	t	f	account-console	0	t	\N	/realms/benchmark/account/	f	\N	f	a5069552-e930-4472-8a7f-facf76e3e7f5	openid-connect	0	f	f	${client_account-console}	f	client-secret	${authBaseUrl}	\N	\N	t	f	f	f
70991b29-bf4b-4882-a292-457465b3e05c	t	f	broker	0	f	\N	\N	t	\N	f	a5069552-e930-4472-8a7f-facf76e3e7f5	openid-connect	0	f	f	${client_broker}	f	client-secret	\N	\N	\N	t	f	f	f
eb91b398-177d-447e-b2ee-603f43be4aa3	t	f	security-admin-console	0	t	\N	/admin/benchmark/console/	f	\N	f	a5069552-e930-4472-8a7f-facf76e3e7f5	openid-connect	0	f	f	${client_security-admin-console}	f	client-secret	${authAdminUrl}	\N	\N	t	f	f	f
c2fe6fd9-156b-415c-843b-93e8bcc3317f	t	f	admin-cli	0	t	\N	\N	f	\N	f	a5069552-e930-4472-8a7f-facf76e3e7f5	openid-connect	0	f	f	${client_admin-cli}	f	client-secret	\N	\N	\N	f	f	t	f
13439173-4f6a-4bb7-bdd7-30e70cce2f65	t	t	api	0	f	R4eNPsL4LCZOSTAdcY59WeunoBgUXGsY		f		f	a5069552-e930-4472-8a7f-facf76e3e7f5	openid-connect	-1	t	f	api	t	client-secret		Genera purpose API	\N	t	f	t	f
\.


--
-- Data for Name: client_attributes; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_attributes (client_id, value, name) FROM stdin;
cccb0307-df62-466f-a9f0-3813069d9c6c	+	post.logout.redirect.uris
89edf3fc-ecca-4425-a996-45dd9e45834d	+	post.logout.redirect.uris
89edf3fc-ecca-4425-a996-45dd9e45834d	S256	pkce.code.challenge.method
42f58925-9b32-4d59-8fb3-f9ec959c68ae	+	post.logout.redirect.uris
42f58925-9b32-4d59-8fb3-f9ec959c68ae	S256	pkce.code.challenge.method
c8389924-e7d6-4232-b74d-de63f8d43745	+	post.logout.redirect.uris
6b5f11f3-9d21-4984-b7b1-5eb23612e671	+	post.logout.redirect.uris
6b5f11f3-9d21-4984-b7b1-5eb23612e671	S256	pkce.code.challenge.method
eb91b398-177d-447e-b2ee-603f43be4aa3	+	post.logout.redirect.uris
eb91b398-177d-447e-b2ee-603f43be4aa3	S256	pkce.code.challenge.method
13439173-4f6a-4bb7-bdd7-30e70cce2f65	1665857027	client.secret.creation.time
13439173-4f6a-4bb7-bdd7-30e70cce2f65	false	oauth2.device.authorization.grant.enabled
13439173-4f6a-4bb7-bdd7-30e70cce2f65	false	oidc.ciba.grant.enabled
13439173-4f6a-4bb7-bdd7-30e70cce2f65	true	backchannel.logout.session.required
13439173-4f6a-4bb7-bdd7-30e70cce2f65	false	backchannel.logout.revoke.offline.tokens
13439173-4f6a-4bb7-bdd7-30e70cce2f65	{}	acr.loa.map
13439173-4f6a-4bb7-bdd7-30e70cce2f65	false	display.on.consent.screen
13439173-4f6a-4bb7-bdd7-30e70cce2f65	false	use.jwks.url
13439173-4f6a-4bb7-bdd7-30e70cce2f65	true	use.refresh.tokens
13439173-4f6a-4bb7-bdd7-30e70cce2f65	false	client_credentials.use_refresh_token
13439173-4f6a-4bb7-bdd7-30e70cce2f65	false	token.response.type.bearer.lower-case
13439173-4f6a-4bb7-bdd7-30e70cce2f65	false	tls-client-certificate-bound-access-tokens
13439173-4f6a-4bb7-bdd7-30e70cce2f65	false	require.pushed.authorization.requests
\.


--
-- Data for Name: client_auth_flow_bindings; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_auth_flow_bindings (client_id, flow_id, binding_name) FROM stdin;
\.


--
-- Data for Name: client_initial_access; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_initial_access (id, realm_id, "timestamp", expiration, count, remaining_count) FROM stdin;
\.


--
-- Data for Name: client_node_registrations; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_node_registrations (client_id, value, name) FROM stdin;
\.


--
-- Data for Name: client_scope; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_scope (id, name, realm_id, description, protocol) FROM stdin;
19e436ae-6a03-4232-ab45-d7c47e0287d2	offline_access	fd4a6218-c54d-4a98-bddb-08dba17ec4ef	OpenID Connect built-in scope: offline_access	openid-connect
ae2bdc00-b717-47d2-93db-86a86fa2d20a	role_list	fd4a6218-c54d-4a98-bddb-08dba17ec4ef	SAML role list	saml
f7ddb717-1874-47bb-89b9-ea361c870f3d	profile	fd4a6218-c54d-4a98-bddb-08dba17ec4ef	OpenID Connect built-in scope: profile	openid-connect
a9d98b27-1b70-484f-8db3-3600797170e1	email	fd4a6218-c54d-4a98-bddb-08dba17ec4ef	OpenID Connect built-in scope: email	openid-connect
a9dc1e53-964a-4a71-9c82-da718caf3ea6	address	fd4a6218-c54d-4a98-bddb-08dba17ec4ef	OpenID Connect built-in scope: address	openid-connect
252698df-d395-439e-9f78-937674264570	phone	fd4a6218-c54d-4a98-bddb-08dba17ec4ef	OpenID Connect built-in scope: phone	openid-connect
faa16604-5520-4de3-9f70-38170b43556c	roles	fd4a6218-c54d-4a98-bddb-08dba17ec4ef	OpenID Connect scope for add user roles to the access token	openid-connect
99564569-211d-4a3c-8005-546a27e27d15	web-origins	fd4a6218-c54d-4a98-bddb-08dba17ec4ef	OpenID Connect scope for add allowed web origins to the access token	openid-connect
4fb21183-5248-4ee7-acd6-82a4b16db221	microprofile-jwt	fd4a6218-c54d-4a98-bddb-08dba17ec4ef	Microprofile - JWT built-in scope	openid-connect
c17ab933-1a12-4559-aaf9-39f7bcc01297	acr	fd4a6218-c54d-4a98-bddb-08dba17ec4ef	OpenID Connect scope for add acr (authentication context class reference) to the token	openid-connect
74bf69a7-fe38-4b19-9bb8-60345762a515	offline_access	a5069552-e930-4472-8a7f-facf76e3e7f5	OpenID Connect built-in scope: offline_access	openid-connect
5d59705f-f2f4-4a72-9cf6-9aad1360d792	role_list	a5069552-e930-4472-8a7f-facf76e3e7f5	SAML role list	saml
f3ce69fa-aeb3-4cb8-9759-67a3372f0c63	profile	a5069552-e930-4472-8a7f-facf76e3e7f5	OpenID Connect built-in scope: profile	openid-connect
c4b6a356-2906-4a17-9546-507476cf81d5	email	a5069552-e930-4472-8a7f-facf76e3e7f5	OpenID Connect built-in scope: email	openid-connect
25958312-9f42-4f0d-9b4f-e5a68e4f830e	address	a5069552-e930-4472-8a7f-facf76e3e7f5	OpenID Connect built-in scope: address	openid-connect
538115b2-78c6-4efb-afe5-ed60f57e671c	phone	a5069552-e930-4472-8a7f-facf76e3e7f5	OpenID Connect built-in scope: phone	openid-connect
d9ff9f93-fc8c-4b50-a10a-a9e4739d96f3	roles	a5069552-e930-4472-8a7f-facf76e3e7f5	OpenID Connect scope for add user roles to the access token	openid-connect
ae1e5ac4-048e-4636-a609-e1d85fa04219	web-origins	a5069552-e930-4472-8a7f-facf76e3e7f5	OpenID Connect scope for add allowed web origins to the access token	openid-connect
97ebab9a-b654-46f7-ba13-258a628b40b0	microprofile-jwt	a5069552-e930-4472-8a7f-facf76e3e7f5	Microprofile - JWT built-in scope	openid-connect
599c454c-a0c0-41a2-b620-3dc847990c5c	acr	a5069552-e930-4472-8a7f-facf76e3e7f5	OpenID Connect scope for add acr (authentication context class reference) to the token	openid-connect
\.


--
-- Data for Name: client_scope_attributes; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_scope_attributes (scope_id, value, name) FROM stdin;
19e436ae-6a03-4232-ab45-d7c47e0287d2	true	display.on.consent.screen
19e436ae-6a03-4232-ab45-d7c47e0287d2	${offlineAccessScopeConsentText}	consent.screen.text
ae2bdc00-b717-47d2-93db-86a86fa2d20a	true	display.on.consent.screen
ae2bdc00-b717-47d2-93db-86a86fa2d20a	${samlRoleListScopeConsentText}	consent.screen.text
f7ddb717-1874-47bb-89b9-ea361c870f3d	true	display.on.consent.screen
f7ddb717-1874-47bb-89b9-ea361c870f3d	${profileScopeConsentText}	consent.screen.text
f7ddb717-1874-47bb-89b9-ea361c870f3d	true	include.in.token.scope
a9d98b27-1b70-484f-8db3-3600797170e1	true	display.on.consent.screen
a9d98b27-1b70-484f-8db3-3600797170e1	${emailScopeConsentText}	consent.screen.text
a9d98b27-1b70-484f-8db3-3600797170e1	true	include.in.token.scope
a9dc1e53-964a-4a71-9c82-da718caf3ea6	true	display.on.consent.screen
a9dc1e53-964a-4a71-9c82-da718caf3ea6	${addressScopeConsentText}	consent.screen.text
a9dc1e53-964a-4a71-9c82-da718caf3ea6	true	include.in.token.scope
252698df-d395-439e-9f78-937674264570	true	display.on.consent.screen
252698df-d395-439e-9f78-937674264570	${phoneScopeConsentText}	consent.screen.text
252698df-d395-439e-9f78-937674264570	true	include.in.token.scope
faa16604-5520-4de3-9f70-38170b43556c	true	display.on.consent.screen
faa16604-5520-4de3-9f70-38170b43556c	${rolesScopeConsentText}	consent.screen.text
faa16604-5520-4de3-9f70-38170b43556c	false	include.in.token.scope
99564569-211d-4a3c-8005-546a27e27d15	false	display.on.consent.screen
99564569-211d-4a3c-8005-546a27e27d15		consent.screen.text
99564569-211d-4a3c-8005-546a27e27d15	false	include.in.token.scope
4fb21183-5248-4ee7-acd6-82a4b16db221	false	display.on.consent.screen
4fb21183-5248-4ee7-acd6-82a4b16db221	true	include.in.token.scope
c17ab933-1a12-4559-aaf9-39f7bcc01297	false	display.on.consent.screen
c17ab933-1a12-4559-aaf9-39f7bcc01297	false	include.in.token.scope
74bf69a7-fe38-4b19-9bb8-60345762a515	true	display.on.consent.screen
74bf69a7-fe38-4b19-9bb8-60345762a515	${offlineAccessScopeConsentText}	consent.screen.text
5d59705f-f2f4-4a72-9cf6-9aad1360d792	true	display.on.consent.screen
5d59705f-f2f4-4a72-9cf6-9aad1360d792	${samlRoleListScopeConsentText}	consent.screen.text
f3ce69fa-aeb3-4cb8-9759-67a3372f0c63	true	display.on.consent.screen
f3ce69fa-aeb3-4cb8-9759-67a3372f0c63	${profileScopeConsentText}	consent.screen.text
f3ce69fa-aeb3-4cb8-9759-67a3372f0c63	true	include.in.token.scope
c4b6a356-2906-4a17-9546-507476cf81d5	true	display.on.consent.screen
c4b6a356-2906-4a17-9546-507476cf81d5	${emailScopeConsentText}	consent.screen.text
c4b6a356-2906-4a17-9546-507476cf81d5	true	include.in.token.scope
25958312-9f42-4f0d-9b4f-e5a68e4f830e	true	display.on.consent.screen
25958312-9f42-4f0d-9b4f-e5a68e4f830e	${addressScopeConsentText}	consent.screen.text
25958312-9f42-4f0d-9b4f-e5a68e4f830e	true	include.in.token.scope
538115b2-78c6-4efb-afe5-ed60f57e671c	true	display.on.consent.screen
538115b2-78c6-4efb-afe5-ed60f57e671c	${phoneScopeConsentText}	consent.screen.text
538115b2-78c6-4efb-afe5-ed60f57e671c	true	include.in.token.scope
d9ff9f93-fc8c-4b50-a10a-a9e4739d96f3	true	display.on.consent.screen
d9ff9f93-fc8c-4b50-a10a-a9e4739d96f3	${rolesScopeConsentText}	consent.screen.text
d9ff9f93-fc8c-4b50-a10a-a9e4739d96f3	false	include.in.token.scope
ae1e5ac4-048e-4636-a609-e1d85fa04219	false	display.on.consent.screen
ae1e5ac4-048e-4636-a609-e1d85fa04219		consent.screen.text
ae1e5ac4-048e-4636-a609-e1d85fa04219	false	include.in.token.scope
97ebab9a-b654-46f7-ba13-258a628b40b0	false	display.on.consent.screen
97ebab9a-b654-46f7-ba13-258a628b40b0	true	include.in.token.scope
599c454c-a0c0-41a2-b620-3dc847990c5c	false	display.on.consent.screen
599c454c-a0c0-41a2-b620-3dc847990c5c	false	include.in.token.scope
\.


--
-- Data for Name: client_scope_client; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_scope_client (client_id, scope_id, default_scope) FROM stdin;
cccb0307-df62-466f-a9f0-3813069d9c6c	faa16604-5520-4de3-9f70-38170b43556c	t
cccb0307-df62-466f-a9f0-3813069d9c6c	f7ddb717-1874-47bb-89b9-ea361c870f3d	t
cccb0307-df62-466f-a9f0-3813069d9c6c	99564569-211d-4a3c-8005-546a27e27d15	t
cccb0307-df62-466f-a9f0-3813069d9c6c	a9d98b27-1b70-484f-8db3-3600797170e1	t
cccb0307-df62-466f-a9f0-3813069d9c6c	c17ab933-1a12-4559-aaf9-39f7bcc01297	t
cccb0307-df62-466f-a9f0-3813069d9c6c	4fb21183-5248-4ee7-acd6-82a4b16db221	f
cccb0307-df62-466f-a9f0-3813069d9c6c	a9dc1e53-964a-4a71-9c82-da718caf3ea6	f
cccb0307-df62-466f-a9f0-3813069d9c6c	252698df-d395-439e-9f78-937674264570	f
cccb0307-df62-466f-a9f0-3813069d9c6c	19e436ae-6a03-4232-ab45-d7c47e0287d2	f
89edf3fc-ecca-4425-a996-45dd9e45834d	faa16604-5520-4de3-9f70-38170b43556c	t
89edf3fc-ecca-4425-a996-45dd9e45834d	f7ddb717-1874-47bb-89b9-ea361c870f3d	t
89edf3fc-ecca-4425-a996-45dd9e45834d	99564569-211d-4a3c-8005-546a27e27d15	t
89edf3fc-ecca-4425-a996-45dd9e45834d	a9d98b27-1b70-484f-8db3-3600797170e1	t
89edf3fc-ecca-4425-a996-45dd9e45834d	c17ab933-1a12-4559-aaf9-39f7bcc01297	t
89edf3fc-ecca-4425-a996-45dd9e45834d	4fb21183-5248-4ee7-acd6-82a4b16db221	f
89edf3fc-ecca-4425-a996-45dd9e45834d	a9dc1e53-964a-4a71-9c82-da718caf3ea6	f
89edf3fc-ecca-4425-a996-45dd9e45834d	252698df-d395-439e-9f78-937674264570	f
89edf3fc-ecca-4425-a996-45dd9e45834d	19e436ae-6a03-4232-ab45-d7c47e0287d2	f
c8dbb960-4dfc-4acf-b3e8-29906a6eb8e1	faa16604-5520-4de3-9f70-38170b43556c	t
c8dbb960-4dfc-4acf-b3e8-29906a6eb8e1	f7ddb717-1874-47bb-89b9-ea361c870f3d	t
c8dbb960-4dfc-4acf-b3e8-29906a6eb8e1	99564569-211d-4a3c-8005-546a27e27d15	t
c8dbb960-4dfc-4acf-b3e8-29906a6eb8e1	a9d98b27-1b70-484f-8db3-3600797170e1	t
c8dbb960-4dfc-4acf-b3e8-29906a6eb8e1	c17ab933-1a12-4559-aaf9-39f7bcc01297	t
c8dbb960-4dfc-4acf-b3e8-29906a6eb8e1	4fb21183-5248-4ee7-acd6-82a4b16db221	f
c8dbb960-4dfc-4acf-b3e8-29906a6eb8e1	a9dc1e53-964a-4a71-9c82-da718caf3ea6	f
c8dbb960-4dfc-4acf-b3e8-29906a6eb8e1	252698df-d395-439e-9f78-937674264570	f
c8dbb960-4dfc-4acf-b3e8-29906a6eb8e1	19e436ae-6a03-4232-ab45-d7c47e0287d2	f
381c4fa8-47ee-4b0e-b5b2-0cfb99e7f168	faa16604-5520-4de3-9f70-38170b43556c	t
381c4fa8-47ee-4b0e-b5b2-0cfb99e7f168	f7ddb717-1874-47bb-89b9-ea361c870f3d	t
381c4fa8-47ee-4b0e-b5b2-0cfb99e7f168	99564569-211d-4a3c-8005-546a27e27d15	t
381c4fa8-47ee-4b0e-b5b2-0cfb99e7f168	a9d98b27-1b70-484f-8db3-3600797170e1	t
381c4fa8-47ee-4b0e-b5b2-0cfb99e7f168	c17ab933-1a12-4559-aaf9-39f7bcc01297	t
381c4fa8-47ee-4b0e-b5b2-0cfb99e7f168	4fb21183-5248-4ee7-acd6-82a4b16db221	f
381c4fa8-47ee-4b0e-b5b2-0cfb99e7f168	a9dc1e53-964a-4a71-9c82-da718caf3ea6	f
381c4fa8-47ee-4b0e-b5b2-0cfb99e7f168	252698df-d395-439e-9f78-937674264570	f
381c4fa8-47ee-4b0e-b5b2-0cfb99e7f168	19e436ae-6a03-4232-ab45-d7c47e0287d2	f
20a47e58-c362-40ef-ba05-16037dbaf30e	faa16604-5520-4de3-9f70-38170b43556c	t
20a47e58-c362-40ef-ba05-16037dbaf30e	f7ddb717-1874-47bb-89b9-ea361c870f3d	t
20a47e58-c362-40ef-ba05-16037dbaf30e	99564569-211d-4a3c-8005-546a27e27d15	t
20a47e58-c362-40ef-ba05-16037dbaf30e	a9d98b27-1b70-484f-8db3-3600797170e1	t
20a47e58-c362-40ef-ba05-16037dbaf30e	c17ab933-1a12-4559-aaf9-39f7bcc01297	t
20a47e58-c362-40ef-ba05-16037dbaf30e	4fb21183-5248-4ee7-acd6-82a4b16db221	f
20a47e58-c362-40ef-ba05-16037dbaf30e	a9dc1e53-964a-4a71-9c82-da718caf3ea6	f
20a47e58-c362-40ef-ba05-16037dbaf30e	252698df-d395-439e-9f78-937674264570	f
20a47e58-c362-40ef-ba05-16037dbaf30e	19e436ae-6a03-4232-ab45-d7c47e0287d2	f
42f58925-9b32-4d59-8fb3-f9ec959c68ae	faa16604-5520-4de3-9f70-38170b43556c	t
42f58925-9b32-4d59-8fb3-f9ec959c68ae	f7ddb717-1874-47bb-89b9-ea361c870f3d	t
42f58925-9b32-4d59-8fb3-f9ec959c68ae	99564569-211d-4a3c-8005-546a27e27d15	t
42f58925-9b32-4d59-8fb3-f9ec959c68ae	a9d98b27-1b70-484f-8db3-3600797170e1	t
42f58925-9b32-4d59-8fb3-f9ec959c68ae	c17ab933-1a12-4559-aaf9-39f7bcc01297	t
42f58925-9b32-4d59-8fb3-f9ec959c68ae	4fb21183-5248-4ee7-acd6-82a4b16db221	f
42f58925-9b32-4d59-8fb3-f9ec959c68ae	a9dc1e53-964a-4a71-9c82-da718caf3ea6	f
42f58925-9b32-4d59-8fb3-f9ec959c68ae	252698df-d395-439e-9f78-937674264570	f
42f58925-9b32-4d59-8fb3-f9ec959c68ae	19e436ae-6a03-4232-ab45-d7c47e0287d2	f
c8389924-e7d6-4232-b74d-de63f8d43745	c4b6a356-2906-4a17-9546-507476cf81d5	t
c8389924-e7d6-4232-b74d-de63f8d43745	d9ff9f93-fc8c-4b50-a10a-a9e4739d96f3	t
c8389924-e7d6-4232-b74d-de63f8d43745	ae1e5ac4-048e-4636-a609-e1d85fa04219	t
c8389924-e7d6-4232-b74d-de63f8d43745	599c454c-a0c0-41a2-b620-3dc847990c5c	t
c8389924-e7d6-4232-b74d-de63f8d43745	f3ce69fa-aeb3-4cb8-9759-67a3372f0c63	t
c8389924-e7d6-4232-b74d-de63f8d43745	74bf69a7-fe38-4b19-9bb8-60345762a515	f
c8389924-e7d6-4232-b74d-de63f8d43745	25958312-9f42-4f0d-9b4f-e5a68e4f830e	f
c8389924-e7d6-4232-b74d-de63f8d43745	538115b2-78c6-4efb-afe5-ed60f57e671c	f
c8389924-e7d6-4232-b74d-de63f8d43745	97ebab9a-b654-46f7-ba13-258a628b40b0	f
6b5f11f3-9d21-4984-b7b1-5eb23612e671	c4b6a356-2906-4a17-9546-507476cf81d5	t
6b5f11f3-9d21-4984-b7b1-5eb23612e671	d9ff9f93-fc8c-4b50-a10a-a9e4739d96f3	t
6b5f11f3-9d21-4984-b7b1-5eb23612e671	ae1e5ac4-048e-4636-a609-e1d85fa04219	t
6b5f11f3-9d21-4984-b7b1-5eb23612e671	599c454c-a0c0-41a2-b620-3dc847990c5c	t
6b5f11f3-9d21-4984-b7b1-5eb23612e671	f3ce69fa-aeb3-4cb8-9759-67a3372f0c63	t
6b5f11f3-9d21-4984-b7b1-5eb23612e671	74bf69a7-fe38-4b19-9bb8-60345762a515	f
6b5f11f3-9d21-4984-b7b1-5eb23612e671	25958312-9f42-4f0d-9b4f-e5a68e4f830e	f
6b5f11f3-9d21-4984-b7b1-5eb23612e671	538115b2-78c6-4efb-afe5-ed60f57e671c	f
6b5f11f3-9d21-4984-b7b1-5eb23612e671	97ebab9a-b654-46f7-ba13-258a628b40b0	f
c2fe6fd9-156b-415c-843b-93e8bcc3317f	c4b6a356-2906-4a17-9546-507476cf81d5	t
c2fe6fd9-156b-415c-843b-93e8bcc3317f	d9ff9f93-fc8c-4b50-a10a-a9e4739d96f3	t
c2fe6fd9-156b-415c-843b-93e8bcc3317f	ae1e5ac4-048e-4636-a609-e1d85fa04219	t
c2fe6fd9-156b-415c-843b-93e8bcc3317f	599c454c-a0c0-41a2-b620-3dc847990c5c	t
c2fe6fd9-156b-415c-843b-93e8bcc3317f	f3ce69fa-aeb3-4cb8-9759-67a3372f0c63	t
c2fe6fd9-156b-415c-843b-93e8bcc3317f	74bf69a7-fe38-4b19-9bb8-60345762a515	f
c2fe6fd9-156b-415c-843b-93e8bcc3317f	25958312-9f42-4f0d-9b4f-e5a68e4f830e	f
c2fe6fd9-156b-415c-843b-93e8bcc3317f	538115b2-78c6-4efb-afe5-ed60f57e671c	f
c2fe6fd9-156b-415c-843b-93e8bcc3317f	97ebab9a-b654-46f7-ba13-258a628b40b0	f
70991b29-bf4b-4882-a292-457465b3e05c	c4b6a356-2906-4a17-9546-507476cf81d5	t
70991b29-bf4b-4882-a292-457465b3e05c	d9ff9f93-fc8c-4b50-a10a-a9e4739d96f3	t
70991b29-bf4b-4882-a292-457465b3e05c	ae1e5ac4-048e-4636-a609-e1d85fa04219	t
70991b29-bf4b-4882-a292-457465b3e05c	599c454c-a0c0-41a2-b620-3dc847990c5c	t
70991b29-bf4b-4882-a292-457465b3e05c	f3ce69fa-aeb3-4cb8-9759-67a3372f0c63	t
70991b29-bf4b-4882-a292-457465b3e05c	74bf69a7-fe38-4b19-9bb8-60345762a515	f
70991b29-bf4b-4882-a292-457465b3e05c	25958312-9f42-4f0d-9b4f-e5a68e4f830e	f
70991b29-bf4b-4882-a292-457465b3e05c	538115b2-78c6-4efb-afe5-ed60f57e671c	f
70991b29-bf4b-4882-a292-457465b3e05c	97ebab9a-b654-46f7-ba13-258a628b40b0	f
9db59d89-b318-48a4-8def-abec5b60607c	c4b6a356-2906-4a17-9546-507476cf81d5	t
9db59d89-b318-48a4-8def-abec5b60607c	d9ff9f93-fc8c-4b50-a10a-a9e4739d96f3	t
9db59d89-b318-48a4-8def-abec5b60607c	ae1e5ac4-048e-4636-a609-e1d85fa04219	t
9db59d89-b318-48a4-8def-abec5b60607c	599c454c-a0c0-41a2-b620-3dc847990c5c	t
9db59d89-b318-48a4-8def-abec5b60607c	f3ce69fa-aeb3-4cb8-9759-67a3372f0c63	t
9db59d89-b318-48a4-8def-abec5b60607c	74bf69a7-fe38-4b19-9bb8-60345762a515	f
9db59d89-b318-48a4-8def-abec5b60607c	25958312-9f42-4f0d-9b4f-e5a68e4f830e	f
9db59d89-b318-48a4-8def-abec5b60607c	538115b2-78c6-4efb-afe5-ed60f57e671c	f
9db59d89-b318-48a4-8def-abec5b60607c	97ebab9a-b654-46f7-ba13-258a628b40b0	f
eb91b398-177d-447e-b2ee-603f43be4aa3	c4b6a356-2906-4a17-9546-507476cf81d5	t
eb91b398-177d-447e-b2ee-603f43be4aa3	d9ff9f93-fc8c-4b50-a10a-a9e4739d96f3	t
eb91b398-177d-447e-b2ee-603f43be4aa3	ae1e5ac4-048e-4636-a609-e1d85fa04219	t
eb91b398-177d-447e-b2ee-603f43be4aa3	599c454c-a0c0-41a2-b620-3dc847990c5c	t
eb91b398-177d-447e-b2ee-603f43be4aa3	f3ce69fa-aeb3-4cb8-9759-67a3372f0c63	t
eb91b398-177d-447e-b2ee-603f43be4aa3	74bf69a7-fe38-4b19-9bb8-60345762a515	f
eb91b398-177d-447e-b2ee-603f43be4aa3	25958312-9f42-4f0d-9b4f-e5a68e4f830e	f
eb91b398-177d-447e-b2ee-603f43be4aa3	538115b2-78c6-4efb-afe5-ed60f57e671c	f
eb91b398-177d-447e-b2ee-603f43be4aa3	97ebab9a-b654-46f7-ba13-258a628b40b0	f
13439173-4f6a-4bb7-bdd7-30e70cce2f65	c4b6a356-2906-4a17-9546-507476cf81d5	t
13439173-4f6a-4bb7-bdd7-30e70cce2f65	d9ff9f93-fc8c-4b50-a10a-a9e4739d96f3	t
13439173-4f6a-4bb7-bdd7-30e70cce2f65	ae1e5ac4-048e-4636-a609-e1d85fa04219	t
13439173-4f6a-4bb7-bdd7-30e70cce2f65	599c454c-a0c0-41a2-b620-3dc847990c5c	t
13439173-4f6a-4bb7-bdd7-30e70cce2f65	f3ce69fa-aeb3-4cb8-9759-67a3372f0c63	t
13439173-4f6a-4bb7-bdd7-30e70cce2f65	74bf69a7-fe38-4b19-9bb8-60345762a515	f
13439173-4f6a-4bb7-bdd7-30e70cce2f65	25958312-9f42-4f0d-9b4f-e5a68e4f830e	f
13439173-4f6a-4bb7-bdd7-30e70cce2f65	538115b2-78c6-4efb-afe5-ed60f57e671c	f
13439173-4f6a-4bb7-bdd7-30e70cce2f65	97ebab9a-b654-46f7-ba13-258a628b40b0	f
\.


--
-- Data for Name: client_scope_role_mapping; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_scope_role_mapping (scope_id, role_id) FROM stdin;
19e436ae-6a03-4232-ab45-d7c47e0287d2	3fca2cc6-4cbc-4b55-b084-74831af2a493
74bf69a7-fe38-4b19-9bb8-60345762a515	882ae7d2-6524-47a6-b123-b2f658c7de64
\.


--
-- Data for Name: client_session; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_session (id, client_id, redirect_uri, state, "timestamp", session_id, auth_method, realm_id, auth_user_id, current_action) FROM stdin;
\.


--
-- Data for Name: client_session_auth_status; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_session_auth_status (authenticator, status, client_session) FROM stdin;
\.


--
-- Data for Name: client_session_note; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_session_note (name, value, client_session) FROM stdin;
\.


--
-- Data for Name: client_session_prot_mapper; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_session_prot_mapper (protocol_mapper_id, client_session) FROM stdin;
\.


--
-- Data for Name: client_session_role; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_session_role (role_id, client_session) FROM stdin;
\.


--
-- Data for Name: client_user_session_note; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_user_session_note (name, value, client_session) FROM stdin;
\.


--
-- Data for Name: component; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.component (id, name, parent_id, provider_id, provider_type, realm_id, sub_type) FROM stdin;
40c39524-272d-4834-8a3b-0388d98c0d20	Trusted Hosts	fd4a6218-c54d-4a98-bddb-08dba17ec4ef	trusted-hosts	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	fd4a6218-c54d-4a98-bddb-08dba17ec4ef	anonymous
9c15243f-409d-40ac-95e3-14443207a147	Consent Required	fd4a6218-c54d-4a98-bddb-08dba17ec4ef	consent-required	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	fd4a6218-c54d-4a98-bddb-08dba17ec4ef	anonymous
1fd97621-0e47-48d5-ad02-5b90619b680c	Full Scope Disabled	fd4a6218-c54d-4a98-bddb-08dba17ec4ef	scope	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	fd4a6218-c54d-4a98-bddb-08dba17ec4ef	anonymous
42cbe5b3-09f0-4b30-ad95-a9e5b01e3f22	Max Clients Limit	fd4a6218-c54d-4a98-bddb-08dba17ec4ef	max-clients	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	fd4a6218-c54d-4a98-bddb-08dba17ec4ef	anonymous
5c1ffaa4-0f9e-4728-acf4-9a1b11a82131	Allowed Protocol Mapper Types	fd4a6218-c54d-4a98-bddb-08dba17ec4ef	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	fd4a6218-c54d-4a98-bddb-08dba17ec4ef	anonymous
63dec832-f81f-4205-8450-b69d4e4b2274	Allowed Client Scopes	fd4a6218-c54d-4a98-bddb-08dba17ec4ef	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	fd4a6218-c54d-4a98-bddb-08dba17ec4ef	anonymous
1fbf0a64-e01a-4040-bdee-6fd9a4baf098	Allowed Protocol Mapper Types	fd4a6218-c54d-4a98-bddb-08dba17ec4ef	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	fd4a6218-c54d-4a98-bddb-08dba17ec4ef	authenticated
892c55ed-bef0-4544-9689-00936e9b823e	Allowed Client Scopes	fd4a6218-c54d-4a98-bddb-08dba17ec4ef	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	fd4a6218-c54d-4a98-bddb-08dba17ec4ef	authenticated
d9a97692-cb0b-48ec-8d27-1264f4f23ff1	rsa-generated	fd4a6218-c54d-4a98-bddb-08dba17ec4ef	rsa-generated	org.keycloak.keys.KeyProvider	fd4a6218-c54d-4a98-bddb-08dba17ec4ef	\N
88c4e744-32fa-4219-88ac-f154148d8714	rsa-enc-generated	fd4a6218-c54d-4a98-bddb-08dba17ec4ef	rsa-enc-generated	org.keycloak.keys.KeyProvider	fd4a6218-c54d-4a98-bddb-08dba17ec4ef	\N
2ab221c0-c777-47fb-bef6-f564484a55fb	hmac-generated	fd4a6218-c54d-4a98-bddb-08dba17ec4ef	hmac-generated	org.keycloak.keys.KeyProvider	fd4a6218-c54d-4a98-bddb-08dba17ec4ef	\N
4b874173-910b-4377-a88d-9b8c881b8d35	aes-generated	fd4a6218-c54d-4a98-bddb-08dba17ec4ef	aes-generated	org.keycloak.keys.KeyProvider	fd4a6218-c54d-4a98-bddb-08dba17ec4ef	\N
47fe3e66-66f8-478a-aa54-6296df5fffb9	rsa-generated	a5069552-e930-4472-8a7f-facf76e3e7f5	rsa-generated	org.keycloak.keys.KeyProvider	a5069552-e930-4472-8a7f-facf76e3e7f5	\N
e89132eb-0fdf-4ad1-81ce-653f8731037b	rsa-enc-generated	a5069552-e930-4472-8a7f-facf76e3e7f5	rsa-enc-generated	org.keycloak.keys.KeyProvider	a5069552-e930-4472-8a7f-facf76e3e7f5	\N
841df189-3189-406f-8f95-06794011d95c	hmac-generated	a5069552-e930-4472-8a7f-facf76e3e7f5	hmac-generated	org.keycloak.keys.KeyProvider	a5069552-e930-4472-8a7f-facf76e3e7f5	\N
50353094-767f-40b0-82ce-f9ded38e3aac	aes-generated	a5069552-e930-4472-8a7f-facf76e3e7f5	aes-generated	org.keycloak.keys.KeyProvider	a5069552-e930-4472-8a7f-facf76e3e7f5	\N
4baa88d1-165e-47ac-9bbb-e861afe57e61	Trusted Hosts	a5069552-e930-4472-8a7f-facf76e3e7f5	trusted-hosts	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	a5069552-e930-4472-8a7f-facf76e3e7f5	anonymous
71ceca52-1153-476d-8024-c18ad6b4d792	Consent Required	a5069552-e930-4472-8a7f-facf76e3e7f5	consent-required	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	a5069552-e930-4472-8a7f-facf76e3e7f5	anonymous
cdbd5c8a-e003-48b6-846b-08a1a9c4f7a9	Full Scope Disabled	a5069552-e930-4472-8a7f-facf76e3e7f5	scope	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	a5069552-e930-4472-8a7f-facf76e3e7f5	anonymous
29cbdbd5-7be3-42e1-a38b-5cae3be57258	Max Clients Limit	a5069552-e930-4472-8a7f-facf76e3e7f5	max-clients	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	a5069552-e930-4472-8a7f-facf76e3e7f5	anonymous
8b742e31-258a-43df-a30e-b6fe1aebb129	Allowed Protocol Mapper Types	a5069552-e930-4472-8a7f-facf76e3e7f5	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	a5069552-e930-4472-8a7f-facf76e3e7f5	anonymous
a5381a85-4d1b-4411-ba95-1e4904f0560a	Allowed Client Scopes	a5069552-e930-4472-8a7f-facf76e3e7f5	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	a5069552-e930-4472-8a7f-facf76e3e7f5	anonymous
3ffb6140-2f40-4bdd-8a7b-10b6a748654c	Allowed Protocol Mapper Types	a5069552-e930-4472-8a7f-facf76e3e7f5	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	a5069552-e930-4472-8a7f-facf76e3e7f5	authenticated
35eb8a8f-1bf9-4f31-b517-2ddea5556c62	Allowed Client Scopes	a5069552-e930-4472-8a7f-facf76e3e7f5	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	a5069552-e930-4472-8a7f-facf76e3e7f5	authenticated
\.


--
-- Data for Name: component_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.component_config (id, component_id, name, value) FROM stdin;
a3aae659-ed0e-41e9-b639-31baa48ffe02	40c39524-272d-4834-8a3b-0388d98c0d20	client-uris-must-match	true
f4aa9750-4406-48ad-a2a6-ac10bd042f21	40c39524-272d-4834-8a3b-0388d98c0d20	host-sending-registration-request-must-match	true
dd2a636f-6d02-4dfd-aa9d-de7348646f82	42cbe5b3-09f0-4b30-ad95-a9e5b01e3f22	max-clients	200
35f8b222-a9e4-4172-b00f-ce8a0b9409dc	1fbf0a64-e01a-4040-bdee-6fd9a4baf098	allowed-protocol-mapper-types	saml-user-attribute-mapper
4862bc4e-b1e5-438c-9dc5-04afd7918ab0	1fbf0a64-e01a-4040-bdee-6fd9a4baf098	allowed-protocol-mapper-types	saml-role-list-mapper
9217b9e4-21c5-46ab-b252-bf74b2f3793c	1fbf0a64-e01a-4040-bdee-6fd9a4baf098	allowed-protocol-mapper-types	oidc-full-name-mapper
f9a6cb11-4159-4456-8c4e-25738563398b	1fbf0a64-e01a-4040-bdee-6fd9a4baf098	allowed-protocol-mapper-types	oidc-address-mapper
27df78cd-e257-4ea1-887d-37909ef10bc8	1fbf0a64-e01a-4040-bdee-6fd9a4baf098	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
91925300-15fc-459f-be28-086e9a5781e4	1fbf0a64-e01a-4040-bdee-6fd9a4baf098	allowed-protocol-mapper-types	saml-user-property-mapper
fd5f4df0-74da-4294-acc5-9b83bc259b62	1fbf0a64-e01a-4040-bdee-6fd9a4baf098	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
2df4de62-b74a-4e9d-8647-7d32ee2ad901	1fbf0a64-e01a-4040-bdee-6fd9a4baf098	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
912800c4-3ea1-4a85-89d1-c96f9d667cd4	892c55ed-bef0-4544-9689-00936e9b823e	allow-default-scopes	true
51a1394e-2fd6-4284-ade6-9b1d9a60920a	63dec832-f81f-4205-8450-b69d4e4b2274	allow-default-scopes	true
4261716e-f235-490d-b961-74e96cd3e55f	5c1ffaa4-0f9e-4728-acf4-9a1b11a82131	allowed-protocol-mapper-types	oidc-address-mapper
f1a34558-d1c8-4565-9c50-08e3df8c104c	5c1ffaa4-0f9e-4728-acf4-9a1b11a82131	allowed-protocol-mapper-types	oidc-full-name-mapper
bc12ee33-b53e-46a6-84ed-3ad323cd6735	5c1ffaa4-0f9e-4728-acf4-9a1b11a82131	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
218b1e76-e716-4d49-9d2b-e8043cc7eb1b	5c1ffaa4-0f9e-4728-acf4-9a1b11a82131	allowed-protocol-mapper-types	saml-user-attribute-mapper
1300a646-6626-4417-beb2-885c937a0ffe	5c1ffaa4-0f9e-4728-acf4-9a1b11a82131	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
c409a359-474f-45e6-85a6-2f5cc5ab48c4	5c1ffaa4-0f9e-4728-acf4-9a1b11a82131	allowed-protocol-mapper-types	saml-user-property-mapper
ac4a5f06-6ff0-4c41-b417-b2be70b7e31b	5c1ffaa4-0f9e-4728-acf4-9a1b11a82131	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
54574a47-43ab-48f3-b716-ee80e9c9d345	5c1ffaa4-0f9e-4728-acf4-9a1b11a82131	allowed-protocol-mapper-types	saml-role-list-mapper
d549eb88-fbbd-4d63-9194-3734ffa43ac1	2ab221c0-c777-47fb-bef6-f564484a55fb	priority	100
071b8eb3-6794-412a-9048-ca46cda7c83a	2ab221c0-c777-47fb-bef6-f564484a55fb	secret	3NmOoFQwhkFn2BjvarA1Em7aQPnmtm7CJGrdu-NMteyn_vmCoDeizJb0DTcLJE0ZhfwYMLDmpQzGyyy5IaOxCA
a69fb6ac-7ff1-4c07-811b-9400e5bd25f2	2ab221c0-c777-47fb-bef6-f564484a55fb	kid	e9f83d06-2fe9-46f6-8a68-e127835e0791
48d16394-feb2-4c8c-b06a-cdd6b173c2fd	2ab221c0-c777-47fb-bef6-f564484a55fb	algorithm	HS256
ec9f9afd-d440-4d07-8e5e-7ba949eb1512	d9a97692-cb0b-48ec-8d27-1264f4f23ff1	privateKey	MIIEpQIBAAKCAQEA3vc6Hv4Y57Jx58yONicUZO0kPv21kXHUmSix7oi5vOksfggIye//bcU0htb1aTYwlrhgIsKa+eHg2f/2brQfIpVda0z/LdSiCy5DzagUNGJKDuxpbZbyXDvYdvauiEK7F3hRJJD0VJaOfyQ7zCGzHAzjcculrX9qdR8aBIGkPlRh+s0BygWHbj87kvLxsH1n6kcsg+aYA07Ke38RGYHYPi4YSGGQA+sshzAJGPsxjPVTddtrM8M2sh4Ck7mTfO4Sc9KDibcn8ITRfrrv5t1z8FSpRIkCbf87mrcjsMQk/raVEhXQfQwhvrW/0FI+9iHX0xxyRBPRsh5Ijq5Wovf0FQIDAQABAoIBAEq6xwarOJKzqty7oTCCQaIgH0VjiI8CfXSGALkHp2UrK8fkDnoMT+qtLZFCC8fjKz7g9gvAeOvmqpO2aBSrl0HimQiFKoPkYBlqPLx5qKf0B4lf8GgULw/92Ovqew3de9J+d4fPc6zEN2disA4Xf24X3cV+sX1olrhBn9lB0Fg5FKd80G1m7VMzwgTwXF++J4MIWqEtMFpTEsCYAQTzDY07qDjwdNrKsUV8/+sNa5vMjSqODSrp0Munzrgqa6aXn4DmEO5NYJKZPoIGwCSR4Qy71q//QQX0zenVc/lSjLxOsS2W0TKb8o5Mf1wdG9OOTl7Ll517MR3Ou4rlvbkdfJMCgYEA/GDwakKLZGBjeZLgFXACWuI36SQGlMRDZ9VhElbIJJpNI8NfQILJzjXusf5wT7oRZlyLjCb5B7k0JwffgiQIZpg45DbuFys1OqdlxLWSKX6LnDBbD6b/qeHT2CXHgMY5A2E1gVzzPEGf+eWkG5WEmOOlSqcvxwtd2s/vYCYw0wsCgYEA4io+3WVxALxMXMQKwbmGgqFlPNGEBzDy9NHHPhYwc2n24kXqH666g/cyWP84V5LqiOWZCte59THc2jxHNDZDH3i6JYivPYNgfLnL/F3GFqleHWcvPGcwAecAQlUhaURv9mU4XMSbTFx7BtrmdEC7PukyGKFE9GKb1zfUGlsyyV8CgYEAsa6eFHGdKaIi5qjdUrp1Lf8uVdmjOIGk4yl7Gio25m4r+Q3HtedepOubjX0RHVBmh6aIKLgXg7SEXyZP2ZP8xh5Nj36MyYsGArFwGLmsmcIaEHCK684rGTOAriCLAMKNyS9bOCR0quuY8ZsXmsP9gpZi/NgP7xa1kSPr58l7flkCgYEAqFSdGZeI9e0wQNNA1lNJhCyv9wZR6DBMhF8mllVZlm1F7b/vs8kO1W3FMWwz+SpGGcIZmHJb291S7bNzo67HYsMueQU0uOnxhKOc6aa56uAARo4oICMFHkVacgR+q6TeWFuaCaHjnIAwqTd/0wLi2r4iJSbS9bn3F8ZbvYonUK0CgYEAudI2Cp9o8BJJ8BfnRjenmB60FK50oYAFomigqS3HcxuDRB4SXMX5DssSdZSUUIaO9IA2JjMfPN51uWDmDxZezD5SCrw83JbWsCQmq4YIMZvtT+AE7CCYEffXYiXb6z5IHFRymex85EuzYfagArYyqtqeQWQTDiTiGp17u8/cNX8=
ca0d05a3-de3e-46e7-a618-75f419d9e483	d9a97692-cb0b-48ec-8d27-1264f4f23ff1	keyUse	SIG
facd62c9-f7f7-4a21-a5a1-3f28f71fd977	d9a97692-cb0b-48ec-8d27-1264f4f23ff1	priority	100
8881a5e6-a660-4685-87cd-edbb3013e86e	d9a97692-cb0b-48ec-8d27-1264f4f23ff1	certificate	MIICmzCCAYMCBgGD3MggETANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMjIxMDE1MTc1MjI2WhcNMzIxMDE1MTc1NDA2WjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQDe9zoe/hjnsnHnzI42JxRk7SQ+/bWRcdSZKLHuiLm86Sx+CAjJ7/9txTSG1vVpNjCWuGAiwpr54eDZ//ZutB8ilV1rTP8t1KILLkPNqBQ0YkoO7GltlvJcO9h29q6IQrsXeFEkkPRUlo5/JDvMIbMcDONxy6Wtf2p1HxoEgaQ+VGH6zQHKBYduPzuS8vGwfWfqRyyD5pgDTsp7fxEZgdg+LhhIYZAD6yyHMAkY+zGM9VN122szwzayHgKTuZN87hJz0oOJtyfwhNF+uu/m3XPwVKlEiQJt/zuatyOwxCT+tpUSFdB9DCG+tb/QUj72IdfTHHJEE9GyHkiOrlai9/QVAgMBAAEwDQYJKoZIhvcNAQELBQADggEBAMXOEvJDn+DE12b7L1ZBvhtRIqRDX8xjvxi6gvS5Jyltm2CuCf/RxHAuRB2LbeAAnWen5Pfmd1iYXAGugMhfJkl9iIrHW0pA474pv452VIEDe0kr5MJ79JlYFg/2HxeOkM26BNosqdhar6xCchULEyhdbYCLvt0+VFEIQh7oTwU4uCsnpZEcbItDvHwxjSOxqopDrSH/vwbPrVkPs7R/BMgcmUi418alheH9jut1IhbDtml9vbc4KoFWjQC4D3cP712gsJXJZhMKxS1m6j6xHHCAkoUgbF1hdq9tlyzApfKcRXWfXenq7vE8CK0bgF9BkZt3c5vEaS1LlFsxjGaoy2c=
848b7b70-02af-4b7b-8fff-4cf14276c443	88c4e744-32fa-4219-88ac-f154148d8714	certificate	MIICmzCCAYMCBgGD3MgijDANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMjIxMDE1MTc1MjI3WhcNMzIxMDE1MTc1NDA3WjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQC3ka9ehBVB+0K9Vz/g8I0k2zSu1mOM8yo+0ZLqGvsUAmbUnDoOesxbSBitbVgpmlhPcSTTn4JGz2Mt/yPK+SFgOsjXqnAwUufwbWZ+uJZ68SoTrALww03F/+XbyCiU78lDQP8WqjdKQKZaOWTy0PxZiAqsPISvvBSenND+WUIJydi5HaMTEWS0OYv/N7iEbMenlfbtLoRbPAGdRvbZ54CXyDhZWjsNL+JJQ3RAU8Byi+186z0RRcSTbQZjlHpzG/snmxjR+i+QUyenBFzIcQRVNvHUesw8ZE4aCDZoUXBbB2Po7z6f4BgD0W0oFWprJKMV/OOP9klGH7yTYe9u/hEtAgMBAAEwDQYJKoZIhvcNAQELBQADggEBAAbj8mmF9ONKVjdcppToF+sXXvCb0TJjXrrXP1V1mt5N1DcC+fIN0fJHT5fsAWvs3uQ2ytErQ/jSvA8fjFkXcaSGrIw6QFij+rxR2K1LRDjcw7URDRYLDxYwwKn3WJengNGzkuXrl1iQzNVhgAnZSKs/0ZiVOoynmBmxg2Sr22Ba5j9/JPCMgRi4YPiYZ9EKRhgX4xUs7vgobJKFheoVzSAQjFIYb5z2hl/aL8dg0BBmPdWKT735wyiH46lRqPBoY7nqesTTEocqbmLi9MDRve6Zv8pqHBYaK2lDSEKZ2Dl3ATO5E9C5i7hvsHRCGCIPKRbWL/+a96Vub+gTrXIa6ek=
0ada1e31-4566-4752-b8eb-2e2eed165a3a	88c4e744-32fa-4219-88ac-f154148d8714	algorithm	RSA-OAEP
1a4fa9fb-ccfd-48eb-9a1e-0db28e93a172	88c4e744-32fa-4219-88ac-f154148d8714	keyUse	ENC
d4f5a689-8a47-4a81-87e8-ee238aca683c	88c4e744-32fa-4219-88ac-f154148d8714	privateKey	MIIEowIBAAKCAQEAt5GvXoQVQftCvVc/4PCNJNs0rtZjjPMqPtGS6hr7FAJm1Jw6DnrMW0gYrW1YKZpYT3Ek05+CRs9jLf8jyvkhYDrI16pwMFLn8G1mfriWevEqE6wC8MNNxf/l28golO/JQ0D/Fqo3SkCmWjlk8tD8WYgKrDyEr7wUnpzQ/llCCcnYuR2jExFktDmL/ze4hGzHp5X27S6EWzwBnUb22eeAl8g4WVo7DS/iSUN0QFPAcovtfOs9EUXEk20GY5R6cxv7J5sY0fovkFMnpwRcyHEEVTbx1HrMPGROGgg2aFFwWwdj6O8+n+AYA9FtKBVqaySjFfzjj/ZJRh+8k2Hvbv4RLQIDAQABAoIBADSPMXup7N49/19wFlmk9ny5iM2Qk+NdElj3L435GK+jembgrlzL+ywdqfcqCiarSyK/3g/7qVT190tJtKleiJhhbHUXl1S2wDMeV8zrtCZSW75TL2pZOTD6colpt3jhaSpo90C5jugjN544tbcycDaAVbH4B/O7MdoyQ0K4MsjTNegaP9aebGT5Ub7taVTktA0pVTq2uNXBQqMZSYY3KbXyXDIHeXfMFOa+PFAgokAFQ0uV/SAe/ZNO+GGMaGRgh0wbMSmW2DThzFTyo/8H3ZzVYItMgSmBMgvnC7kASiu8Q0qcQzwbwTPXu2tEj5C8DHgFQm9IdnkbxARahGTFLy8CgYEA8edkleBG1Uu4JJTQBQZRVd/5StMTeqpBTpS4+uAzl4Lg5UHrBEDWJMEDlRPeTaaqQgC20p7kYGoLxUi9bAwVmPuughd5QK4YXd8NzerdHCyqLGIKVw5Ff6+2T6TEJz8a5E7uU8P7spMkwRQnGjE1EllfxXLru/kdHsZ6Ato2uNcCgYEAwkQU084VXsXqKfVXTklJ59wgIPjklr6PM9f7BAZMoPiigikgdgye+0nmbc3Ti1uu35wHjHMvC/T78n6wCej6+ArjaQx0q8rPzi8yzG0fR5LEEu+FwTDYEVovosf/0HxvC73x258pVffHpa+rnbhZKGHWn2DTqB8elRg9reb9MZsCgYAa+2JezUtZUz7Q5cBmLxQ3beoSjISps//g0fnoEcXvamvHZpjeOpUoOFc786FiK+rlvcqmp451qp5xfPGT8a0fCUOnwxKFQmX5Yn3ZsA7Fq723gaABodfirCi7rXcroYBQYvV2Zm/WtU7uMl9CLqbqywlBrtXYe6rh2eWWF9zutQKBgEv1RNOAW/i/mAyp4mY4383p0yIxT2flwKZ7x6lOMT4rmZcdL5UY4DzPK2s5tIJj6d+C6aywCPA67RxnDrwBPcgosbyMYz4cwd4TtGAcNsPMjh/9SaY9S+6U/dU/MDY7wUutDFlcRVRY2tZc9tRnlWzlvH565Kdy64lOfid2DwALAoGBAIwYNqlI3Be3EALuvotVWAnD5qBHK03SP6ZaGZRiS5su1aqiP09sMQEHD8Wpj7IglueIHKCGwaWmWVJRJbgERE+xCAFf3JTZ9uhyF9Szv6BbtvMzgTFIu6S9OwgUuEoB/+T+uFPrR8Gzk3IlBnZlN8EO2JgaEIbz2PWhzDX+6hrt
add6b516-46b7-41fd-b172-7dbfbc37c879	88c4e744-32fa-4219-88ac-f154148d8714	priority	100
fc814a93-af18-4c32-bcbe-7332a017f86e	4b874173-910b-4377-a88d-9b8c881b8d35	kid	fe153ad7-be85-4a1f-ac13-941ebc7b684f
ca5ec124-5a5d-492d-a711-5dff6a317e7a	4b874173-910b-4377-a88d-9b8c881b8d35	priority	100
d2a1e4e8-cbd1-4b36-8f18-d777cf99ba79	4b874173-910b-4377-a88d-9b8c881b8d35	secret	1iTgx9T1MwSNeM9tmw7jMw
707aa900-13cc-42b8-b1eb-b121a3f8de96	47fe3e66-66f8-478a-aa54-6296df5fffb9	certificate	MIICoTCCAYkCBgGD3M8G6DANBgkqhkiG9w0BAQsFADAUMRIwEAYDVQQDDAliZW5jaG1hcmswHhcNMjIxMDE1MTc1OTU4WhcNMzIxMDE1MTgwMTM4WjAUMRIwEAYDVQQDDAliZW5jaG1hcmswggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQDWcnDcRkeWs3ax6vwHaH/mliKMw7Wm1l5tWDzoLGjlxu24NhEQZ1TUGgnLGiwsAl17tVIRqPYIJkp4oMU9dOb+K3XqzRjYyYI9HCnaTC0/9sTMxOaFXQyGq7mE1izCe/YUd30hTDIs171oaofq7lWdApw37TZONRbJoslUxWMPNuavNCMyo6YnfKtSaWbm17OKDcUYPcvLmvgLN/Fei9ELG/0ocvrNCkT+QUdqvVwTK3bbDho8W5TQz7trW6i0+f8KwsmhLXyO6auf7DScH4/RSX+IzEWvCi9RYazND+cEu73cSqXx2Zy7ayHUvKJCu74Px/2/93MiDpxsbD5gIOm7AgMBAAEwDQYJKoZIhvcNAQELBQADggEBAM9gP2l2U22woJde0FfGc8h3bGQCHL3M0ecOdxTMWoOfwhcBI1nlC5wHT+c6XMhq13JVYwO9j0+4ac0KT3qEhDdwraqal+oaFJfCC+y78RT4/HkN68pBgr/A1/+MFX8/i36d2S5yuwkmCce4Dp5jPwn773tx4ew5whKalA/6TcLEkyFW+BJO931LIMRfL2U+j1e1DwwA6yhHlNrNBoMbkgS7pJCson1isnWJuZGQrfPFtEDfPG/uEkBkvMX3HGPWIRn7XsVaMsMT256erHYL0Frp8UnmTMPiJf3tF38frPO35fXdRrz+PBPRTymeEAX7rq0lkssMda/tw7pdaX4WA3g=
3671922e-4773-4a72-bbf5-0351943d8bc7	47fe3e66-66f8-478a-aa54-6296df5fffb9	priority	100
065217f9-d4cc-4911-9777-7585312fe7fc	47fe3e66-66f8-478a-aa54-6296df5fffb9	privateKey	MIIEowIBAAKCAQEA1nJw3EZHlrN2ser8B2h/5pYijMO1ptZebVg86Cxo5cbtuDYREGdU1BoJyxosLAJde7VSEaj2CCZKeKDFPXTm/it16s0Y2MmCPRwp2kwtP/bEzMTmhV0Mhqu5hNYswnv2FHd9IUwyLNe9aGqH6u5VnQKcN+02TjUWyaLJVMVjDzbmrzQjMqOmJ3yrUmlm5tezig3FGD3Ly5r4CzfxXovRCxv9KHL6zQpE/kFHar1cEyt22w4aPFuU0M+7a1uotPn/CsLJoS18jumrn+w0nB+P0Ul/iMxFrwovUWGszQ/nBLu93Eql8dmcu2sh1LyiQru+D8f9v/dzIg6cbGw+YCDpuwIDAQABAoIBAATMcccUEYUHRggsLHCT/4yu3l4NARMXJ+zFdTNyzvQZU/dzykT2Mvk+DesMDmH7uZDLmWcIw1yiUrdJTbCW3ZZhbZWP+lbbh30LlMosOzT7tiKo40mnr+CRliipTD4b3QFPPS8SD+td9oCQJbN1mtfVF57OwZDVckmXyW6KrjFIbDUC7wOAppBzStchJoK2vIJE/B5RDUuX88J2ZVLR9jnsSv2wHla8Vrb31M1bl24WFM+JMkQ9CQUqGwgQ6QsYKLo0Tiv4lJBHu1LmAqbiPhm6no8EmxgXPp1aYHQ/aPNVQP57CfEsvPmoSPaIc6NfojdJrhDbt689PmBHt94p5y0CgYEA+1ccXRCUcE7dWlb1npCnqtnFpse7aXGOT9jJ33hO790M7eTyDH4jZwpOOZwmsmbXr5G4juMGTrrbGg0x7VaFABmGVTY9HQp0/AYK2x8qRs4MNhxLJLI2Evbka2ZKwCgz+G1/c3Pge9+7iSbSx+u5UK6lX0aoC/YWIqyiS15PX4UCgYEA2mw7CCE+xIkiA9aIiAh2hPpiwlpuBx2xpZfpnLp1mu//XR+GKcXsouVz1gAYqedqZxSdPOSrucmmCrAhrsyo33UG+N1Sj19lewjCF/UT1j2uLirtKkrjLL7dpjDwwi6grU1FfmQEzEyr6NYqaYOQPvVyVWlgEQgFz0gx9t4/SD8CgYEAzfWsQHb9rKpzqTvpOm6/drnNxcWWRenP/I5hnsYvqU8y8R7TWnli+WTwhTT4YOj1heGboztWR93G/aoiZ6KmilZgRiOUIOAYzQ0GiFkZg7wFNbIpwYBn31KCC6BfUOeg7sqLzkf+hIPqYZF22GzKBtuWmGSGAIc/zFo7BBfcYyECgYBoW22Y5MlofVyTGN0CoYh+4GJvGWWYYMePppUnHK8z55bKl1UygC4fZiGCDWm7Q6XCukal4Vtq2L1MPfrZ2U6V9QPvw06+0YVa00Rozd88bRvbUwcdPcpshoS/8oIVRNHf+xtI1+Cy+67m/+wjnYg9jGekB0Su3nZoIsY8fNMfYQKBgE4Y4c4QgRsi813BXYoTN0os+iSzwn3FGS3NKJ/OOKNDjSeHj3A5nXtLTtHGGEmJTnTNjZFcUK+WLzUr1JlkfW6mJrx1VOjgYqxtA4oreRVQ9vNROeFTrCTisMFUASk34OH9upfGwnlGoyTMv2PB5+IyerROKaDGj6RqwBHlK+UY
27338be1-765e-4a8f-852f-d3323edbde63	47fe3e66-66f8-478a-aa54-6296df5fffb9	keyUse	SIG
7487b009-7e29-47f3-a989-9026a36518a7	e89132eb-0fdf-4ad1-81ce-653f8731037b	keyUse	ENC
6666cac1-dbd2-4ca7-b27c-e9242e8e2cc1	e89132eb-0fdf-4ad1-81ce-653f8731037b	certificate	MIICoTCCAYkCBgGD3M8KNTANBgkqhkiG9w0BAQsFADAUMRIwEAYDVQQDDAliZW5jaG1hcmswHhcNMjIxMDE1MTc1OTU5WhcNMzIxMDE1MTgwMTM5WjAUMRIwEAYDVQQDDAliZW5jaG1hcmswggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCifFFyWd8t1n1LlJhCsvwpyQaQEhTSgP99x0sAgPBoEsREnS8FuHxQ/RMbNGJZWP18sIMYaiVlT8WnvjxsliYzEnXXw2dzp0FtoF+LP1ADoYd9sY6zU4W3TdrWQKe1AARoY5Md5/yCJ+EN4ez9dUjk+pxEj7o8dB7w25V7ZshlbBXFOEBa9tkoRcCP7f1j4xO/y8n+40feQfnblvAUr7k4WLLKLH7g8BP/Twst3P/obVweiQITn02KiOWcPn0mG9m39D3nWI5EsfRMA8OO7BHU0wxwPKRuFH8rfCE6K4Zd1ASE34ZcYRTkA8lyfQQMkAwJtujAsPRmy+AYpJQcco9hAgMBAAEwDQYJKoZIhvcNAQELBQADggEBAGQL7SR0FYeA5B37hE7mk1n3Eykfh0xBPa/3luGYT03zXoUnCYNgjI55PwKKFz1YmgOZ9e7UIUk3mDegRgM7Xe4rIzoyQE/hmDdOOVR/HNV+ZOu0p7R51Y4KWx2DtOEvvZBvVmC3+qct4q/bQoRAA3RRsX+FHf5CjRkc/ISZrywVhnhmkcLVK5vAXjAP7w04DKBP0qDqq8rwNElXizMFrIbtPaOdK7pQOTMrVq5ezlDP2st9/QgTvSpVtDpUWYrDeGewk5/RZLkcXsRPTpYQbhwT3Jm86aEIS5SAKqvctWlq0mLY6wwPmzOSKpdubm48O3oKgSrR9rwhaPqJFv9aWEo=
879af5af-410e-415e-87f0-606fd233315f	e89132eb-0fdf-4ad1-81ce-653f8731037b	algorithm	RSA-OAEP
1d1b9966-b4ff-4088-a68f-7ab1df12786b	e89132eb-0fdf-4ad1-81ce-653f8731037b	privateKey	MIIEpAIBAAKCAQEAonxRclnfLdZ9S5SYQrL8KckGkBIU0oD/fcdLAIDwaBLERJ0vBbh8UP0TGzRiWVj9fLCDGGolZU/Fp748bJYmMxJ118Nnc6dBbaBfiz9QA6GHfbGOs1OFt03a1kCntQAEaGOTHef8gifhDeHs/XVI5PqcRI+6PHQe8NuVe2bIZWwVxThAWvbZKEXAj+39Y+MTv8vJ/uNH3kH525bwFK+5OFiyyix+4PAT/08LLdz/6G1cHokCE59NiojlnD59JhvZt/Q951iORLH0TAPDjuwR1NMMcDykbhR/K3whOiuGXdQEhN+GXGEU5APJcn0EDJAMCbbowLD0ZsvgGKSUHHKPYQIDAQABAoIBAAvumS85OPxtaIdpAsK90MAOH8nrVKrIsk+9l4e9RZTpm+Qgrtf6s5Zhn0o7eeVvIDOh5V6g8jITE5ln4kQPGqsGy1nsOD1JUQgIjjue4J9Y+Kba/SG0xnhZjUfNOQOVBr3WYh1WGzhA+XPtiAZs2yIwN9Lebcy2skxPCRZ7dnKMHsAn93jntTQ9kZDGTjeBh+phUanxrd1VlJUZPbKE1ceZsaegu7FQBhKxnxMb0uL4UE3IoBq+9VvQT/IaRm9QJpwvR/8EB7GS3YdokTZO0s0BRGhgQ1e3pq6Q0hraT7hiZsDsxbDhdrHiUScidz6YrXOmaGaTOsjZN5ZgErxfnakCgYEA1CZYja4jPy2zBdBwyKjVuzgjvLk2FCzq04pwXbh1QxPt7m8IGqKSVINTc6AMCtFspRFABGyhoZCVF0n0whfkk6PILMOwjN53aVToeZKVDKTydKLiZlJgKwPI80Ico1h7wmGbr3ADmIMtLMi+ZbfOi0AGaI7oWL/mszOi4t3V1kMCgYEAxBINNyZvD5viUQSBRE76OiTLMTv+tCcstMRgQvAu0GfAe5aymEOPCY/JbPX0qveyaw08Vjv7Jf7UAmScL8hlRaKqBK0kFatQeHmZ/0GYY31SmViTdS6Ebw8mtuewIyuH5OiZxEDYWUUo3TKTwp+DjGbmXWOywxTc2qT692Zq04sCgYBRv+0Du4SthcikhuvPBvBFUp7CzIQARka++WvPUZMuI/HdnT98NAU7N9fiiFvbl1PMT9dhXRLzlSk+bis418gm9EfgqA/SWK+fES78GfYBh1Y+h73CPB/+s1iuFF3AvAoEn2REuF9KV9ICneBwheG7WxKdG+SAvoIBr/YmgeEyzQKBgQClXbw7qXS+K3Fjd3M3E41EAMhHTBx0AR5Zj87IZh51syvKkL0sYr5/CACQn5itoZ+fXlhnOsuFrjlNk2GPg2q2oozWyNjIVebW1WimusI2FvrVTrl/ea5EpPi4BwytfQdubydROIfAMu5WMVQiL7sZbagZV/7rPetPlRn+EylCJQKBgQDMsbKGyc5738jjN86pBmyfD0BjPgSSQ65ZkDSPY7JnyRsa0Hsnh8s5RvMtxJ66Yd1BCqLWB4CUxEpevsW/3XApzr3LVLS1IrWsvyVNB5zcuN//xL2OQNeacJKiCsJCbr2bW+lxpl6a/2q6PZ6MXLl2hGbW+04VYy6HseIAfHLJ1Q==
7fe42e7c-b223-463d-bc76-43c97dedd5f2	e89132eb-0fdf-4ad1-81ce-653f8731037b	priority	100
fa7678f0-2806-46a5-93b0-a3c03afd4a73	50353094-767f-40b0-82ce-f9ded38e3aac	priority	100
06ff50ff-d827-4e54-8aff-88ada15c188a	50353094-767f-40b0-82ce-f9ded38e3aac	kid	e7514767-74ed-418e-86ef-0566b6e02ca4
ef7b89f5-1bf3-425e-be62-b3271b2345d4	50353094-767f-40b0-82ce-f9ded38e3aac	secret	nxnYTuv99jrtEDpfxvaqXg
8341ca65-9a4a-4049-971b-b615c166d00a	841df189-3189-406f-8f95-06794011d95c	secret	5GyAm6DDA463V-xYuFTs0x3MdQ6yKgPZQD14GOPJXXw7Ja3qIpS53JJVMKNuAMfT2UuJStQBJtQKVqlUAmlHUA
388043d6-0a86-49fb-8c1c-d07ef0a27678	841df189-3189-406f-8f95-06794011d95c	kid	3659012d-ef96-47b6-a8b4-750be9a93e76
efd9c2f3-71a8-4ed8-9e85-dcc2eabdb4b2	841df189-3189-406f-8f95-06794011d95c	algorithm	HS256
2647255e-9340-4b32-962a-dc5b39ce706b	841df189-3189-406f-8f95-06794011d95c	priority	100
d03dd43a-1d5d-4a8b-aee6-e21ab6c3fa40	8b742e31-258a-43df-a30e-b6fe1aebb129	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
dff779a0-a3b9-4704-b0c1-dc0c1f6e5f17	8b742e31-258a-43df-a30e-b6fe1aebb129	allowed-protocol-mapper-types	saml-user-property-mapper
b8426a1e-1fec-4084-bdb3-80228a99af42	8b742e31-258a-43df-a30e-b6fe1aebb129	allowed-protocol-mapper-types	saml-role-list-mapper
0bf0114d-fbd1-4cc4-a081-10477349c202	8b742e31-258a-43df-a30e-b6fe1aebb129	allowed-protocol-mapper-types	saml-user-attribute-mapper
e8dcb2d5-5cab-4110-b1ff-3665891d7331	8b742e31-258a-43df-a30e-b6fe1aebb129	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
bee6ffb2-a694-435d-adc9-9fe38fc6b6d3	8b742e31-258a-43df-a30e-b6fe1aebb129	allowed-protocol-mapper-types	oidc-full-name-mapper
3d1dfb11-3aa7-46a4-b4fc-05853dbd5fdb	8b742e31-258a-43df-a30e-b6fe1aebb129	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
428fd48b-541d-4cd0-8124-55160e42288b	8b742e31-258a-43df-a30e-b6fe1aebb129	allowed-protocol-mapper-types	oidc-address-mapper
b084b9d0-af02-4851-ba7a-3f515b315594	3ffb6140-2f40-4bdd-8a7b-10b6a748654c	allowed-protocol-mapper-types	saml-user-property-mapper
0afc195f-1c89-4bb2-a53b-3ed4605f4464	3ffb6140-2f40-4bdd-8a7b-10b6a748654c	allowed-protocol-mapper-types	oidc-full-name-mapper
8c8ffe10-052c-4b3e-9289-45f1d02d4c85	3ffb6140-2f40-4bdd-8a7b-10b6a748654c	allowed-protocol-mapper-types	oidc-address-mapper
7d305285-f868-4361-81e2-c4e88430bf68	3ffb6140-2f40-4bdd-8a7b-10b6a748654c	allowed-protocol-mapper-types	saml-user-attribute-mapper
d782a126-30b8-4781-bf56-1bfd1bd35a1b	3ffb6140-2f40-4bdd-8a7b-10b6a748654c	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
8d55479c-37b7-4657-98d7-d85f34aa80c5	3ffb6140-2f40-4bdd-8a7b-10b6a748654c	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
5680a93b-ebf7-4317-b4c1-b0e8da81357d	3ffb6140-2f40-4bdd-8a7b-10b6a748654c	allowed-protocol-mapper-types	saml-role-list-mapper
d7494eab-5a30-4067-aacf-9f8a776cd821	3ffb6140-2f40-4bdd-8a7b-10b6a748654c	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
e8028d27-a132-4879-a3bf-ce3e4037d0ca	4baa88d1-165e-47ac-9bbb-e861afe57e61	client-uris-must-match	true
e92be056-bda4-4c3e-bf3e-df0c31752889	4baa88d1-165e-47ac-9bbb-e861afe57e61	host-sending-registration-request-must-match	true
72f41b59-8368-4155-9c1c-0a815614eb94	35eb8a8f-1bf9-4f31-b517-2ddea5556c62	allow-default-scopes	true
998dc2dd-de29-4002-9371-b91c9edafa60	a5381a85-4d1b-4411-ba95-1e4904f0560a	allow-default-scopes	true
d6f2d9bd-cf1c-4694-bfd6-f212304784fe	29cbdbd5-7be3-42e1-a38b-5cae3be57258	max-clients	200
\.


--
-- Data for Name: composite_role; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.composite_role (composite, child_role) FROM stdin;
cfc3fb84-f97b-410d-b816-711da8ba6815	3fb6e99e-07c7-460b-8a3d-5031c6461ffe
cfc3fb84-f97b-410d-b816-711da8ba6815	55e365c0-8c1f-4524-a955-5722246a9571
cfc3fb84-f97b-410d-b816-711da8ba6815	8f18e445-aa94-453c-95bd-01b5c0347e48
cfc3fb84-f97b-410d-b816-711da8ba6815	298dab0c-471c-4ac4-bf21-a7475a2c3f78
cfc3fb84-f97b-410d-b816-711da8ba6815	885fec8d-986d-4235-9c94-113706a2f92d
cfc3fb84-f97b-410d-b816-711da8ba6815	13a207f7-672c-4919-9746-476a06055627
cfc3fb84-f97b-410d-b816-711da8ba6815	f1e392c1-c0af-40ac-b921-eab6765586b0
cfc3fb84-f97b-410d-b816-711da8ba6815	d525217e-9fe0-4ea7-8a5c-27690fb3fb12
cfc3fb84-f97b-410d-b816-711da8ba6815	4cd69517-246f-449b-81cc-ad0530194bb9
cfc3fb84-f97b-410d-b816-711da8ba6815	672d071c-b5be-4bae-9a76-e5d0ecaf30c2
cfc3fb84-f97b-410d-b816-711da8ba6815	6f0e2d62-9636-4626-9012-84acb71af193
cfc3fb84-f97b-410d-b816-711da8ba6815	a848a573-9d2a-4aa7-8832-cc40862b40b9
cfc3fb84-f97b-410d-b816-711da8ba6815	6b57a6e7-b683-419e-befb-5e0226cd9933
cfc3fb84-f97b-410d-b816-711da8ba6815	03b9a427-1fef-4cdc-bd4c-b5a455a9da94
cfc3fb84-f97b-410d-b816-711da8ba6815	1372ad25-219c-4982-b685-c008980fed28
cfc3fb84-f97b-410d-b816-711da8ba6815	cdbbe31a-6f4c-44dd-aca2-2d24aae895f4
cfc3fb84-f97b-410d-b816-711da8ba6815	d3f0b1f1-04b6-443b-9481-9455be811a87
cfc3fb84-f97b-410d-b816-711da8ba6815	6e0b9809-20ae-4965-9b38-0d0821febac3
0bede6dd-e745-421f-a443-e2363d61f5e2	2fc339b9-4b7d-4699-bbe7-fd60338cb100
298dab0c-471c-4ac4-bf21-a7475a2c3f78	6e0b9809-20ae-4965-9b38-0d0821febac3
298dab0c-471c-4ac4-bf21-a7475a2c3f78	1372ad25-219c-4982-b685-c008980fed28
885fec8d-986d-4235-9c94-113706a2f92d	cdbbe31a-6f4c-44dd-aca2-2d24aae895f4
0bede6dd-e745-421f-a443-e2363d61f5e2	1afb9cf1-486e-4ffd-8685-d222f10eec5e
1afb9cf1-486e-4ffd-8685-d222f10eec5e	2cf6c764-b378-4b6b-a398-75676b9fe4df
1b632039-f301-4e9c-83b8-f16997a23951	8dd03112-6e82-42cd-af80-b9dd53f0d358
cfc3fb84-f97b-410d-b816-711da8ba6815	69f92697-af51-4ca7-8920-abd7749f3020
0bede6dd-e745-421f-a443-e2363d61f5e2	3fca2cc6-4cbc-4b55-b084-74831af2a493
0bede6dd-e745-421f-a443-e2363d61f5e2	d077e162-6b0f-4c58-9f52-63a426d17e14
cfc3fb84-f97b-410d-b816-711da8ba6815	08696078-5f3f-48f9-987a-793c6203fcdf
cfc3fb84-f97b-410d-b816-711da8ba6815	f32deb0a-53e5-42d2-a518-c6bb3ea5637b
cfc3fb84-f97b-410d-b816-711da8ba6815	d487d81c-3064-4007-b9b3-e45a17e30992
cfc3fb84-f97b-410d-b816-711da8ba6815	cf956566-3266-4418-a10d-60dbef1cf94d
cfc3fb84-f97b-410d-b816-711da8ba6815	660a287c-531e-4f78-8785-aabbf3c4753a
cfc3fb84-f97b-410d-b816-711da8ba6815	a488e284-69e2-4f26-9215-0c6b0db16865
cfc3fb84-f97b-410d-b816-711da8ba6815	fdd96fdd-3a77-4429-9703-19cd07a0c1bc
cfc3fb84-f97b-410d-b816-711da8ba6815	8929cc25-b7b9-4070-85ed-a2b22361260f
cfc3fb84-f97b-410d-b816-711da8ba6815	dc091829-dd67-4972-86ce-a22926a00861
cfc3fb84-f97b-410d-b816-711da8ba6815	7757473c-b2d3-4d0a-9cc8-7a4ae5c8cfc8
cfc3fb84-f97b-410d-b816-711da8ba6815	4656fae1-1934-4374-b611-a9ad08310662
cfc3fb84-f97b-410d-b816-711da8ba6815	d9bf51c0-84d8-497c-a11d-0017a29d7ec3
cfc3fb84-f97b-410d-b816-711da8ba6815	d4d0c6bb-bf39-43bc-aade-37b8be7edb34
cfc3fb84-f97b-410d-b816-711da8ba6815	a1fc3916-b33f-4546-b3e2-880c5e1fc03e
cfc3fb84-f97b-410d-b816-711da8ba6815	b84c39a4-b5d4-4e62-a6a4-61accd5074c3
cfc3fb84-f97b-410d-b816-711da8ba6815	9c6cc7c7-4f14-4de4-bf24-811adc5768e7
cfc3fb84-f97b-410d-b816-711da8ba6815	ac35566d-7538-4eab-a1fa-cbc6096b527f
cf956566-3266-4418-a10d-60dbef1cf94d	b84c39a4-b5d4-4e62-a6a4-61accd5074c3
d487d81c-3064-4007-b9b3-e45a17e30992	ac35566d-7538-4eab-a1fa-cbc6096b527f
d487d81c-3064-4007-b9b3-e45a17e30992	a1fc3916-b33f-4546-b3e2-880c5e1fc03e
836e66c8-0174-4787-96c3-a0ca95a667b5	9389327d-b475-45a6-b123-d93dd8498a0b
836e66c8-0174-4787-96c3-a0ca95a667b5	3acaf0cf-025a-47ac-94ec-7925bd09c20b
836e66c8-0174-4787-96c3-a0ca95a667b5	29dc5e64-5091-4bc3-a149-27e82ca6c974
836e66c8-0174-4787-96c3-a0ca95a667b5	bb361804-707e-4b7e-beef-88bc06fb5310
836e66c8-0174-4787-96c3-a0ca95a667b5	89021d3e-21ff-4425-944f-a9ea63901c45
836e66c8-0174-4787-96c3-a0ca95a667b5	25fcff83-84b1-402a-b796-2447f7142fff
836e66c8-0174-4787-96c3-a0ca95a667b5	11ce66da-b699-484e-8ce7-6a3f2d8cd21a
836e66c8-0174-4787-96c3-a0ca95a667b5	d3dcd1d1-88dd-47bc-b34f-de831f8f76b2
836e66c8-0174-4787-96c3-a0ca95a667b5	93ed949d-2ae1-493c-8e40-7a1a3382893f
836e66c8-0174-4787-96c3-a0ca95a667b5	e6708c3b-b25b-4a16-8049-0f5c3af9e360
836e66c8-0174-4787-96c3-a0ca95a667b5	bb627965-83b7-45d9-a4a6-9d22d788b511
836e66c8-0174-4787-96c3-a0ca95a667b5	3ba4a1c5-82ce-4f16-9eb6-4062e9ac2c4a
836e66c8-0174-4787-96c3-a0ca95a667b5	45f5d57f-c3f5-4944-a93b-056d7e942140
836e66c8-0174-4787-96c3-a0ca95a667b5	37f2f5a4-6bf0-4cb0-bef0-168a514d5b29
836e66c8-0174-4787-96c3-a0ca95a667b5	055644d3-4ecf-4871-8f9c-2082c185f3dc
836e66c8-0174-4787-96c3-a0ca95a667b5	c49ea7bf-ffe2-4b8a-95cb-297beb0f351d
836e66c8-0174-4787-96c3-a0ca95a667b5	07b47704-25fd-425e-b972-bc7e088ce837
29dc5e64-5091-4bc3-a149-27e82ca6c974	37f2f5a4-6bf0-4cb0-bef0-168a514d5b29
29dc5e64-5091-4bc3-a149-27e82ca6c974	07b47704-25fd-425e-b972-bc7e088ce837
acff3968-4e16-483c-9471-b13b5ff72b18	269866ce-df68-4cff-b4a2-7f91ff8c0d32
bb361804-707e-4b7e-beef-88bc06fb5310	055644d3-4ecf-4871-8f9c-2082c185f3dc
acff3968-4e16-483c-9471-b13b5ff72b18	73804fa0-9183-42fe-a3a5-1060ca7425e3
73804fa0-9183-42fe-a3a5-1060ca7425e3	e0947fb3-cda1-4c6b-a1d9-b11ff69523b9
af7c0699-9a22-4e39-ba40-b61c4aedf225	1bdfc84e-0617-4c7d-a06c-84fc2359bd2f
cfc3fb84-f97b-410d-b816-711da8ba6815	3ad145aa-1643-41e0-a012-ba5d6d4919d3
836e66c8-0174-4787-96c3-a0ca95a667b5	44041310-01bd-4c95-aa34-b47d65116ddd
acff3968-4e16-483c-9471-b13b5ff72b18	882ae7d2-6524-47a6-b123-b2f658c7de64
acff3968-4e16-483c-9471-b13b5ff72b18	98c4277b-291c-4ced-9b16-10165366d5ad
\.


--
-- Data for Name: credential; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.credential (id, salt, type, user_id, created_date, user_label, secret_data, credential_data, priority) FROM stdin;
64b6b88d-31eb-4cdc-b717-c5cfa4460460	\N	password	9fe4e884-63fd-47f4-8427-96bb82746a67	1665856800434	\N	{"value":"onPoQD/0CbbytfBMlMARnsGlYV5FEZbOD6CiQZLd8hFH1YJUqk+x1vnB677OkCnMXrWWbjXnpE1oFYdKEBGYnQ==","salt":"dfotEfUhOStFhSbeQDeuOA==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
\.


--
-- Data for Name: databasechangelog; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) FROM stdin;
1.0.0.Final-KEYCLOAK-5461	sthorger@redhat.com	META-INF/jpa-changelog-1.0.0.Final.xml	2022-10-15 17:54:02.118151	1	EXECUTED	8:bda77d94bf90182a1e30c24f1c155ec7	createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...		\N	4.8.0	\N	\N	5856441306
1.0.0.Final-KEYCLOAK-5461	sthorger@redhat.com	META-INF/db2-jpa-changelog-1.0.0.Final.xml	2022-10-15 17:54:02.133629	2	MARK_RAN	8:1ecb330f30986693d1cba9ab579fa219	createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...		\N	4.8.0	\N	\N	5856441306
1.1.0.Beta1	sthorger@redhat.com	META-INF/jpa-changelog-1.1.0.Beta1.xml	2022-10-15 17:54:02.200867	3	EXECUTED	8:cb7ace19bc6d959f305605d255d4c843	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=CLIENT_ATTRIBUTES; createTable tableName=CLIENT_SESSION_NOTE; createTable tableName=APP_NODE_REGISTRATIONS; addColumn table...		\N	4.8.0	\N	\N	5856441306
1.1.0.Final	sthorger@redhat.com	META-INF/jpa-changelog-1.1.0.Final.xml	2022-10-15 17:54:02.20626	4	EXECUTED	8:80230013e961310e6872e871be424a63	renameColumn newColumnName=EVENT_TIME, oldColumnName=TIME, tableName=EVENT_ENTITY		\N	4.8.0	\N	\N	5856441306
1.2.0.Beta1	psilva@redhat.com	META-INF/jpa-changelog-1.2.0.Beta1.xml	2022-10-15 17:54:02.341997	5	EXECUTED	8:67f4c20929126adc0c8e9bf48279d244	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...		\N	4.8.0	\N	\N	5856441306
1.2.0.Beta1	psilva@redhat.com	META-INF/db2-jpa-changelog-1.2.0.Beta1.xml	2022-10-15 17:54:02.345603	6	MARK_RAN	8:7311018b0b8179ce14628ab412bb6783	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...		\N	4.8.0	\N	\N	5856441306
1.2.0.RC1	bburke@redhat.com	META-INF/jpa-changelog-1.2.0.CR1.xml	2022-10-15 17:54:02.490979	7	EXECUTED	8:037ba1216c3640f8785ee6b8e7c8e3c1	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...		\N	4.8.0	\N	\N	5856441306
1.2.0.RC1	bburke@redhat.com	META-INF/db2-jpa-changelog-1.2.0.CR1.xml	2022-10-15 17:54:02.497356	8	MARK_RAN	8:7fe6ffe4af4df289b3157de32c624263	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...		\N	4.8.0	\N	\N	5856441306
1.2.0.Final	keycloak	META-INF/jpa-changelog-1.2.0.Final.xml	2022-10-15 17:54:02.506508	9	EXECUTED	8:9c136bc3187083a98745c7d03bc8a303	update tableName=CLIENT; update tableName=CLIENT; update tableName=CLIENT		\N	4.8.0	\N	\N	5856441306
1.3.0	bburke@redhat.com	META-INF/jpa-changelog-1.3.0.xml	2022-10-15 17:54:02.654819	10	EXECUTED	8:b5f09474dca81fb56a97cf5b6553d331	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=ADMI...		\N	4.8.0	\N	\N	5856441306
1.4.0	bburke@redhat.com	META-INF/jpa-changelog-1.4.0.xml	2022-10-15 17:54:02.743725	11	EXECUTED	8:ca924f31bd2a3b219fdcfe78c82dacf4	delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...		\N	4.8.0	\N	\N	5856441306
1.4.0	bburke@redhat.com	META-INF/db2-jpa-changelog-1.4.0.xml	2022-10-15 17:54:02.747869	12	MARK_RAN	8:8acad7483e106416bcfa6f3b824a16cd	delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...		\N	4.8.0	\N	\N	5856441306
1.5.0	bburke@redhat.com	META-INF/jpa-changelog-1.5.0.xml	2022-10-15 17:54:02.782605	13	EXECUTED	8:9b1266d17f4f87c78226f5055408fd5e	delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...		\N	4.8.0	\N	\N	5856441306
1.6.1_from15	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2022-10-15 17:54:02.809652	14	EXECUTED	8:d80ec4ab6dbfe573550ff72396c7e910	addColumn tableName=REALM; addColumn tableName=KEYCLOAK_ROLE; addColumn tableName=CLIENT; createTable tableName=OFFLINE_USER_SESSION; createTable tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_US_SES_PK2, tableName=...		\N	4.8.0	\N	\N	5856441306
1.6.1_from16-pre	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2022-10-15 17:54:02.812903	15	MARK_RAN	8:d86eb172171e7c20b9c849b584d147b2	delete tableName=OFFLINE_CLIENT_SESSION; delete tableName=OFFLINE_USER_SESSION		\N	4.8.0	\N	\N	5856441306
1.6.1_from16	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2022-10-15 17:54:02.816074	16	MARK_RAN	8:5735f46f0fa60689deb0ecdc2a0dea22	dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_US_SES_PK, tableName=OFFLINE_USER_SESSION; dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_CL_SES_PK, tableName=OFFLINE_CLIENT_SESSION; addColumn tableName=OFFLINE_USER_SESSION; update tableName=OF...		\N	4.8.0	\N	\N	5856441306
1.6.1	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2022-10-15 17:54:02.819192	17	EXECUTED	8:d41d8cd98f00b204e9800998ecf8427e	empty		\N	4.8.0	\N	\N	5856441306
1.7.0	bburke@redhat.com	META-INF/jpa-changelog-1.7.0.xml	2022-10-15 17:54:02.882376	18	EXECUTED	8:5c1a8fd2014ac7fc43b90a700f117b23	createTable tableName=KEYCLOAK_GROUP; createTable tableName=GROUP_ROLE_MAPPING; createTable tableName=GROUP_ATTRIBUTE; createTable tableName=USER_GROUP_MEMBERSHIP; createTable tableName=REALM_DEFAULT_GROUPS; addColumn tableName=IDENTITY_PROVIDER; ...		\N	4.8.0	\N	\N	5856441306
1.8.0	mposolda@redhat.com	META-INF/jpa-changelog-1.8.0.xml	2022-10-15 17:54:02.93546	19	EXECUTED	8:1f6c2c2dfc362aff4ed75b3f0ef6b331	addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...		\N	4.8.0	\N	\N	5856441306
1.8.0-2	keycloak	META-INF/jpa-changelog-1.8.0.xml	2022-10-15 17:54:02.942745	20	EXECUTED	8:dee9246280915712591f83a127665107	dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL		\N	4.8.0	\N	\N	5856441306
authz-3.4.0.CR1-resource-server-pk-change-part1	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2022-10-15 17:54:03.496091	45	EXECUTED	8:a164ae073c56ffdbc98a615493609a52	addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_RESOURCE; addColumn tableName=RESOURCE_SERVER_SCOPE		\N	4.8.0	\N	\N	5856441306
1.8.0	mposolda@redhat.com	META-INF/db2-jpa-changelog-1.8.0.xml	2022-10-15 17:54:02.946342	21	MARK_RAN	8:9eb2ee1fa8ad1c5e426421a6f8fdfa6a	addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...		\N	4.8.0	\N	\N	5856441306
1.8.0-2	keycloak	META-INF/db2-jpa-changelog-1.8.0.xml	2022-10-15 17:54:02.950041	22	MARK_RAN	8:dee9246280915712591f83a127665107	dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL		\N	4.8.0	\N	\N	5856441306
1.9.0	mposolda@redhat.com	META-INF/jpa-changelog-1.9.0.xml	2022-10-15 17:54:02.99093	23	EXECUTED	8:d9fa18ffa355320395b86270680dd4fe	update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=REALM; update tableName=REALM; customChange; dr...		\N	4.8.0	\N	\N	5856441306
1.9.1	keycloak	META-INF/jpa-changelog-1.9.1.xml	2022-10-15 17:54:02.999067	24	EXECUTED	8:90cff506fedb06141ffc1c71c4a1214c	modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=PUBLIC_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM		\N	4.8.0	\N	\N	5856441306
1.9.1	keycloak	META-INF/db2-jpa-changelog-1.9.1.xml	2022-10-15 17:54:03.002227	25	MARK_RAN	8:11a788aed4961d6d29c427c063af828c	modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM		\N	4.8.0	\N	\N	5856441306
1.9.2	keycloak	META-INF/jpa-changelog-1.9.2.xml	2022-10-15 17:54:03.037134	26	EXECUTED	8:a4218e51e1faf380518cce2af5d39b43	createIndex indexName=IDX_USER_EMAIL, tableName=USER_ENTITY; createIndex indexName=IDX_USER_ROLE_MAPPING, tableName=USER_ROLE_MAPPING; createIndex indexName=IDX_USER_GROUP_MAPPING, tableName=USER_GROUP_MEMBERSHIP; createIndex indexName=IDX_USER_CO...		\N	4.8.0	\N	\N	5856441306
authz-2.0.0	psilva@redhat.com	META-INF/jpa-changelog-authz-2.0.0.xml	2022-10-15 17:54:03.138789	27	EXECUTED	8:d9e9a1bfaa644da9952456050f07bbdc	createTable tableName=RESOURCE_SERVER; addPrimaryKey constraintName=CONSTRAINT_FARS, tableName=RESOURCE_SERVER; addUniqueConstraint constraintName=UK_AU8TT6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER; createTable tableName=RESOURCE_SERVER_RESOU...		\N	4.8.0	\N	\N	5856441306
authz-2.5.1	psilva@redhat.com	META-INF/jpa-changelog-authz-2.5.1.xml	2022-10-15 17:54:03.144353	28	EXECUTED	8:d1bf991a6163c0acbfe664b615314505	update tableName=RESOURCE_SERVER_POLICY		\N	4.8.0	\N	\N	5856441306
2.1.0-KEYCLOAK-5461	bburke@redhat.com	META-INF/jpa-changelog-2.1.0.xml	2022-10-15 17:54:03.223817	29	EXECUTED	8:88a743a1e87ec5e30bf603da68058a8c	createTable tableName=BROKER_LINK; createTable tableName=FED_USER_ATTRIBUTE; createTable tableName=FED_USER_CONSENT; createTable tableName=FED_USER_CONSENT_ROLE; createTable tableName=FED_USER_CONSENT_PROT_MAPPER; createTable tableName=FED_USER_CR...		\N	4.8.0	\N	\N	5856441306
2.2.0	bburke@redhat.com	META-INF/jpa-changelog-2.2.0.xml	2022-10-15 17:54:03.242724	30	EXECUTED	8:c5517863c875d325dea463d00ec26d7a	addColumn tableName=ADMIN_EVENT_ENTITY; createTable tableName=CREDENTIAL_ATTRIBUTE; createTable tableName=FED_CREDENTIAL_ATTRIBUTE; modifyDataType columnName=VALUE, tableName=CREDENTIAL; addForeignKeyConstraint baseTableName=FED_CREDENTIAL_ATTRIBU...		\N	4.8.0	\N	\N	5856441306
2.3.0	bburke@redhat.com	META-INF/jpa-changelog-2.3.0.xml	2022-10-15 17:54:03.264555	31	EXECUTED	8:ada8b4833b74a498f376d7136bc7d327	createTable tableName=FEDERATED_USER; addPrimaryKey constraintName=CONSTR_FEDERATED_USER, tableName=FEDERATED_USER; dropDefaultValue columnName=TOTP, tableName=USER_ENTITY; dropColumn columnName=TOTP, tableName=USER_ENTITY; addColumn tableName=IDE...		\N	4.8.0	\N	\N	5856441306
2.4.0	bburke@redhat.com	META-INF/jpa-changelog-2.4.0.xml	2022-10-15 17:54:03.271412	32	EXECUTED	8:b9b73c8ea7299457f99fcbb825c263ba	customChange		\N	4.8.0	\N	\N	5856441306
2.5.0	bburke@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2022-10-15 17:54:03.278263	33	EXECUTED	8:07724333e625ccfcfc5adc63d57314f3	customChange; modifyDataType columnName=USER_ID, tableName=OFFLINE_USER_SESSION		\N	4.8.0	\N	\N	5856441306
2.5.0-unicode-oracle	hmlnarik@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2022-10-15 17:54:03.280559	34	MARK_RAN	8:8b6fd445958882efe55deb26fc541a7b	modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...		\N	4.8.0	\N	\N	5856441306
2.5.0-unicode-other-dbs	hmlnarik@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2022-10-15 17:54:03.313004	35	EXECUTED	8:29b29cfebfd12600897680147277a9d7	modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...		\N	4.8.0	\N	\N	5856441306
2.5.0-duplicate-email-support	slawomir@dabek.name	META-INF/jpa-changelog-2.5.0.xml	2022-10-15 17:54:03.319162	36	EXECUTED	8:73ad77ca8fd0410c7f9f15a471fa52bc	addColumn tableName=REALM		\N	4.8.0	\N	\N	5856441306
2.5.0-unique-group-names	hmlnarik@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2022-10-15 17:54:03.325204	37	EXECUTED	8:64f27a6fdcad57f6f9153210f2ec1bdb	addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP		\N	4.8.0	\N	\N	5856441306
2.5.1	bburke@redhat.com	META-INF/jpa-changelog-2.5.1.xml	2022-10-15 17:54:03.329274	38	EXECUTED	8:27180251182e6c31846c2ddab4bc5781	addColumn tableName=FED_USER_CONSENT		\N	4.8.0	\N	\N	5856441306
3.0.0	bburke@redhat.com	META-INF/jpa-changelog-3.0.0.xml	2022-10-15 17:54:03.334078	39	EXECUTED	8:d56f201bfcfa7a1413eb3e9bc02978f9	addColumn tableName=IDENTITY_PROVIDER		\N	4.8.0	\N	\N	5856441306
3.2.0-fix	keycloak	META-INF/jpa-changelog-3.2.0.xml	2022-10-15 17:54:03.33653	40	MARK_RAN	8:91f5522bf6afdc2077dfab57fbd3455c	addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS		\N	4.8.0	\N	\N	5856441306
3.2.0-fix-with-keycloak-5416	keycloak	META-INF/jpa-changelog-3.2.0.xml	2022-10-15 17:54:03.338771	41	MARK_RAN	8:0f01b554f256c22caeb7d8aee3a1cdc8	dropIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS; addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS; createIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS		\N	4.8.0	\N	\N	5856441306
3.2.0-fix-offline-sessions	hmlnarik	META-INF/jpa-changelog-3.2.0.xml	2022-10-15 17:54:03.344869	42	EXECUTED	8:ab91cf9cee415867ade0e2df9651a947	customChange		\N	4.8.0	\N	\N	5856441306
3.2.0-fixed	keycloak	META-INF/jpa-changelog-3.2.0.xml	2022-10-15 17:54:03.482887	43	EXECUTED	8:ceac9b1889e97d602caf373eadb0d4b7	addColumn tableName=REALM; dropPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_PK2, tableName=OFFLINE_CLIENT_SESSION; dropColumn columnName=CLIENT_SESSION_ID, tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_P...		\N	4.8.0	\N	\N	5856441306
3.3.0	keycloak	META-INF/jpa-changelog-3.3.0.xml	2022-10-15 17:54:03.489014	44	EXECUTED	8:84b986e628fe8f7fd8fd3c275c5259f2	addColumn tableName=USER_ENTITY		\N	4.8.0	\N	\N	5856441306
authz-3.4.0.CR1-resource-server-pk-change-part2-KEYCLOAK-6095	hmlnarik@redhat.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2022-10-15 17:54:03.503954	46	EXECUTED	8:70a2b4f1f4bd4dbf487114bdb1810e64	customChange		\N	4.8.0	\N	\N	5856441306
authz-3.4.0.CR1-resource-server-pk-change-part3-fixed	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2022-10-15 17:54:03.506834	47	MARK_RAN	8:7be68b71d2f5b94b8df2e824f2860fa2	dropIndex indexName=IDX_RES_SERV_POL_RES_SERV, tableName=RESOURCE_SERVER_POLICY; dropIndex indexName=IDX_RES_SRV_RES_RES_SRV, tableName=RESOURCE_SERVER_RESOURCE; dropIndex indexName=IDX_RES_SRV_SCOPE_RES_SRV, tableName=RESOURCE_SERVER_SCOPE		\N	4.8.0	\N	\N	5856441306
authz-3.4.0.CR1-resource-server-pk-change-part3-fixed-nodropindex	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2022-10-15 17:54:03.565246	48	EXECUTED	8:bab7c631093c3861d6cf6144cd944982	addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_POLICY; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_RESOURCE; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, ...		\N	4.8.0	\N	\N	5856441306
authn-3.4.0.CR1-refresh-token-max-reuse	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2022-10-15 17:54:03.571447	49	EXECUTED	8:fa809ac11877d74d76fe40869916daad	addColumn tableName=REALM		\N	4.8.0	\N	\N	5856441306
3.4.0	keycloak	META-INF/jpa-changelog-3.4.0.xml	2022-10-15 17:54:03.633685	50	EXECUTED	8:fac23540a40208f5f5e326f6ceb4d291	addPrimaryKey constraintName=CONSTRAINT_REALM_DEFAULT_ROLES, tableName=REALM_DEFAULT_ROLES; addPrimaryKey constraintName=CONSTRAINT_COMPOSITE_ROLE, tableName=COMPOSITE_ROLE; addPrimaryKey constraintName=CONSTR_REALM_DEFAULT_GROUPS, tableName=REALM...		\N	4.8.0	\N	\N	5856441306
3.4.0-KEYCLOAK-5230	hmlnarik@redhat.com	META-INF/jpa-changelog-3.4.0.xml	2022-10-15 17:54:03.670521	51	EXECUTED	8:2612d1b8a97e2b5588c346e817307593	createIndex indexName=IDX_FU_ATTRIBUTE, tableName=FED_USER_ATTRIBUTE; createIndex indexName=IDX_FU_CONSENT, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CONSENT_RU, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CREDENTIAL, t...		\N	4.8.0	\N	\N	5856441306
3.4.1	psilva@redhat.com	META-INF/jpa-changelog-3.4.1.xml	2022-10-15 17:54:03.67581	52	EXECUTED	8:9842f155c5db2206c88bcb5d1046e941	modifyDataType columnName=VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.8.0	\N	\N	5856441306
3.4.2	keycloak	META-INF/jpa-changelog-3.4.2.xml	2022-10-15 17:54:03.680645	53	EXECUTED	8:2e12e06e45498406db72d5b3da5bbc76	update tableName=REALM		\N	4.8.0	\N	\N	5856441306
3.4.2-KEYCLOAK-5172	mkanis@redhat.com	META-INF/jpa-changelog-3.4.2.xml	2022-10-15 17:54:03.685369	54	EXECUTED	8:33560e7c7989250c40da3abdabdc75a4	update tableName=CLIENT		\N	4.8.0	\N	\N	5856441306
4.0.0-KEYCLOAK-6335	bburke@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2022-10-15 17:54:03.694852	55	EXECUTED	8:87a8d8542046817a9107c7eb9cbad1cd	createTable tableName=CLIENT_AUTH_FLOW_BINDINGS; addPrimaryKey constraintName=C_CLI_FLOW_BIND, tableName=CLIENT_AUTH_FLOW_BINDINGS		\N	4.8.0	\N	\N	5856441306
4.0.0-CLEANUP-UNUSED-TABLE	bburke@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2022-10-15 17:54:03.703083	56	EXECUTED	8:3ea08490a70215ed0088c273d776311e	dropTable tableName=CLIENT_IDENTITY_PROV_MAPPING		\N	4.8.0	\N	\N	5856441306
4.0.0-KEYCLOAK-6228	bburke@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2022-10-15 17:54:03.736199	57	EXECUTED	8:2d56697c8723d4592ab608ce14b6ed68	dropUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHOGM8UEWRT, tableName=USER_CONSENT; dropNotNullConstraint columnName=CLIENT_ID, tableName=USER_CONSENT; addColumn tableName=USER_CONSENT; addUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHO...		\N	4.8.0	\N	\N	5856441306
4.0.0-KEYCLOAK-5579-fixed	mposolda@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2022-10-15 17:54:03.889353	58	EXECUTED	8:3e423e249f6068ea2bbe48bf907f9d86	dropForeignKeyConstraint baseTableName=CLIENT_TEMPLATE_ATTRIBUTES, constraintName=FK_CL_TEMPL_ATTR_TEMPL; renameTable newTableName=CLIENT_SCOPE_ATTRIBUTES, oldTableName=CLIENT_TEMPLATE_ATTRIBUTES; renameColumn newColumnName=SCOPE_ID, oldColumnName...		\N	4.8.0	\N	\N	5856441306
authz-4.0.0.CR1	psilva@redhat.com	META-INF/jpa-changelog-authz-4.0.0.CR1.xml	2022-10-15 17:54:03.928776	59	EXECUTED	8:15cabee5e5df0ff099510a0fc03e4103	createTable tableName=RESOURCE_SERVER_PERM_TICKET; addPrimaryKey constraintName=CONSTRAINT_FAPMT, tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRHO213XCX4WNKOG82SSPMT...		\N	4.8.0	\N	\N	5856441306
authz-4.0.0.Beta3	psilva@redhat.com	META-INF/jpa-changelog-authz-4.0.0.Beta3.xml	2022-10-15 17:54:03.937511	60	EXECUTED	8:4b80200af916ac54d2ffbfc47918ab0e	addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRPO2128CX4WNKOG82SSRFY, referencedTableName=RESOURCE_SERVER_POLICY		\N	4.8.0	\N	\N	5856441306
authz-4.2.0.Final	mhajas@redhat.com	META-INF/jpa-changelog-authz-4.2.0.Final.xml	2022-10-15 17:54:03.950614	61	EXECUTED	8:66564cd5e168045d52252c5027485bbb	createTable tableName=RESOURCE_URIS; addForeignKeyConstraint baseTableName=RESOURCE_URIS, constraintName=FK_RESOURCE_SERVER_URIS, referencedTableName=RESOURCE_SERVER_RESOURCE; customChange; dropColumn columnName=URI, tableName=RESOURCE_SERVER_RESO...		\N	4.8.0	\N	\N	5856441306
authz-4.2.0.Final-KEYCLOAK-9944	hmlnarik@redhat.com	META-INF/jpa-changelog-authz-4.2.0.Final.xml	2022-10-15 17:54:03.957486	62	EXECUTED	8:1c7064fafb030222be2bd16ccf690f6f	addPrimaryKey constraintName=CONSTRAINT_RESOUR_URIS_PK, tableName=RESOURCE_URIS		\N	4.8.0	\N	\N	5856441306
4.2.0-KEYCLOAK-6313	wadahiro@gmail.com	META-INF/jpa-changelog-4.2.0.xml	2022-10-15 17:54:03.962581	63	EXECUTED	8:2de18a0dce10cdda5c7e65c9b719b6e5	addColumn tableName=REQUIRED_ACTION_PROVIDER		\N	4.8.0	\N	\N	5856441306
4.3.0-KEYCLOAK-7984	wadahiro@gmail.com	META-INF/jpa-changelog-4.3.0.xml	2022-10-15 17:54:03.968125	64	EXECUTED	8:03e413dd182dcbd5c57e41c34d0ef682	update tableName=REQUIRED_ACTION_PROVIDER		\N	4.8.0	\N	\N	5856441306
4.6.0-KEYCLOAK-7950	psilva@redhat.com	META-INF/jpa-changelog-4.6.0.xml	2022-10-15 17:54:03.973199	65	EXECUTED	8:d27b42bb2571c18fbe3fe4e4fb7582a7	update tableName=RESOURCE_SERVER_RESOURCE		\N	4.8.0	\N	\N	5856441306
4.6.0-KEYCLOAK-8377	keycloak	META-INF/jpa-changelog-4.6.0.xml	2022-10-15 17:54:03.990254	66	EXECUTED	8:698baf84d9fd0027e9192717c2154fb8	createTable tableName=ROLE_ATTRIBUTE; addPrimaryKey constraintName=CONSTRAINT_ROLE_ATTRIBUTE_PK, tableName=ROLE_ATTRIBUTE; addForeignKeyConstraint baseTableName=ROLE_ATTRIBUTE, constraintName=FK_ROLE_ATTRIBUTE_ID, referencedTableName=KEYCLOAK_ROLE...		\N	4.8.0	\N	\N	5856441306
4.6.0-KEYCLOAK-8555	gideonray@gmail.com	META-INF/jpa-changelog-4.6.0.xml	2022-10-15 17:54:03.996562	67	EXECUTED	8:ced8822edf0f75ef26eb51582f9a821a	createIndex indexName=IDX_COMPONENT_PROVIDER_TYPE, tableName=COMPONENT		\N	4.8.0	\N	\N	5856441306
4.7.0-KEYCLOAK-1267	sguilhen@redhat.com	META-INF/jpa-changelog-4.7.0.xml	2022-10-15 17:54:04.0035	68	EXECUTED	8:f0abba004cf429e8afc43056df06487d	addColumn tableName=REALM		\N	4.8.0	\N	\N	5856441306
4.7.0-KEYCLOAK-7275	keycloak	META-INF/jpa-changelog-4.7.0.xml	2022-10-15 17:54:04.018217	69	EXECUTED	8:6662f8b0b611caa359fcf13bf63b4e24	renameColumn newColumnName=CREATED_ON, oldColumnName=LAST_SESSION_REFRESH, tableName=OFFLINE_USER_SESSION; addNotNullConstraint columnName=CREATED_ON, tableName=OFFLINE_USER_SESSION; addColumn tableName=OFFLINE_USER_SESSION; customChange; createIn...		\N	4.8.0	\N	\N	5856441306
4.8.0-KEYCLOAK-8835	sguilhen@redhat.com	META-INF/jpa-changelog-4.8.0.xml	2022-10-15 17:54:04.025828	70	EXECUTED	8:9e6b8009560f684250bdbdf97670d39e	addNotNullConstraint columnName=SSO_MAX_LIFESPAN_REMEMBER_ME, tableName=REALM; addNotNullConstraint columnName=SSO_IDLE_TIMEOUT_REMEMBER_ME, tableName=REALM		\N	4.8.0	\N	\N	5856441306
authz-7.0.0-KEYCLOAK-10443	psilva@redhat.com	META-INF/jpa-changelog-authz-7.0.0.xml	2022-10-15 17:54:04.030911	71	EXECUTED	8:4223f561f3b8dc655846562b57bb502e	addColumn tableName=RESOURCE_SERVER		\N	4.8.0	\N	\N	5856441306
8.0.0-adding-credential-columns	keycloak	META-INF/jpa-changelog-8.0.0.xml	2022-10-15 17:54:04.041259	72	EXECUTED	8:215a31c398b363ce383a2b301202f29e	addColumn tableName=CREDENTIAL; addColumn tableName=FED_USER_CREDENTIAL		\N	4.8.0	\N	\N	5856441306
8.0.0-updating-credential-data-not-oracle-fixed	keycloak	META-INF/jpa-changelog-8.0.0.xml	2022-10-15 17:54:04.052206	73	EXECUTED	8:83f7a671792ca98b3cbd3a1a34862d3d	update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL		\N	4.8.0	\N	\N	5856441306
8.0.0-updating-credential-data-oracle-fixed	keycloak	META-INF/jpa-changelog-8.0.0.xml	2022-10-15 17:54:04.05513	74	MARK_RAN	8:f58ad148698cf30707a6efbdf8061aa7	update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL		\N	4.8.0	\N	\N	5856441306
8.0.0-credential-cleanup-fixed	keycloak	META-INF/jpa-changelog-8.0.0.xml	2022-10-15 17:54:04.090313	75	EXECUTED	8:79e4fd6c6442980e58d52ffc3ee7b19c	dropDefaultValue columnName=COUNTER, tableName=CREDENTIAL; dropDefaultValue columnName=DIGITS, tableName=CREDENTIAL; dropDefaultValue columnName=PERIOD, tableName=CREDENTIAL; dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; dropColumn ...		\N	4.8.0	\N	\N	5856441306
8.0.0-resource-tag-support	keycloak	META-INF/jpa-changelog-8.0.0.xml	2022-10-15 17:54:04.09912	76	EXECUTED	8:87af6a1e6d241ca4b15801d1f86a297d	addColumn tableName=MIGRATION_MODEL; createIndex indexName=IDX_UPDATE_TIME, tableName=MIGRATION_MODEL		\N	4.8.0	\N	\N	5856441306
9.0.0-always-display-client	keycloak	META-INF/jpa-changelog-9.0.0.xml	2022-10-15 17:54:04.104636	77	EXECUTED	8:b44f8d9b7b6ea455305a6d72a200ed15	addColumn tableName=CLIENT		\N	4.8.0	\N	\N	5856441306
9.0.0-drop-constraints-for-column-increase	keycloak	META-INF/jpa-changelog-9.0.0.xml	2022-10-15 17:54:04.10771	78	MARK_RAN	8:2d8ed5aaaeffd0cb004c046b4a903ac5	dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5PMT, tableName=RESOURCE_SERVER_PERM_TICKET; dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER_RESOURCE; dropPrimaryKey constraintName=CONSTRAINT_O...		\N	4.8.0	\N	\N	5856441306
9.0.0-increase-column-size-federated-fk	keycloak	META-INF/jpa-changelog-9.0.0.xml	2022-10-15 17:54:04.136024	79	EXECUTED	8:e290c01fcbc275326c511633f6e2acde	modifyDataType columnName=CLIENT_ID, tableName=FED_USER_CONSENT; modifyDataType columnName=CLIENT_REALM_CONSTRAINT, tableName=KEYCLOAK_ROLE; modifyDataType columnName=OWNER, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=CLIENT_ID, ta...		\N	4.8.0	\N	\N	5856441306
9.0.0-recreate-constraints-after-column-increase	keycloak	META-INF/jpa-changelog-9.0.0.xml	2022-10-15 17:54:04.138624	80	MARK_RAN	8:c9db8784c33cea210872ac2d805439f8	addNotNullConstraint columnName=CLIENT_ID, tableName=OFFLINE_CLIENT_SESSION; addNotNullConstraint columnName=OWNER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNullConstraint columnName=REQUESTER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNull...		\N	4.8.0	\N	\N	5856441306
9.0.1-add-index-to-client.client_id	keycloak	META-INF/jpa-changelog-9.0.1.xml	2022-10-15 17:54:04.145213	81	EXECUTED	8:95b676ce8fc546a1fcfb4c92fae4add5	createIndex indexName=IDX_CLIENT_ID, tableName=CLIENT		\N	4.8.0	\N	\N	5856441306
9.0.1-KEYCLOAK-12579-drop-constraints	keycloak	META-INF/jpa-changelog-9.0.1.xml	2022-10-15 17:54:04.148273	82	MARK_RAN	8:38a6b2a41f5651018b1aca93a41401e5	dropUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP		\N	4.8.0	\N	\N	5856441306
9.0.1-KEYCLOAK-12579-add-not-null-constraint	keycloak	META-INF/jpa-changelog-9.0.1.xml	2022-10-15 17:54:04.15348	83	EXECUTED	8:3fb99bcad86a0229783123ac52f7609c	addNotNullConstraint columnName=PARENT_GROUP, tableName=KEYCLOAK_GROUP		\N	4.8.0	\N	\N	5856441306
9.0.1-KEYCLOAK-12579-recreate-constraints	keycloak	META-INF/jpa-changelog-9.0.1.xml	2022-10-15 17:54:04.155945	84	MARK_RAN	8:64f27a6fdcad57f6f9153210f2ec1bdb	addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP		\N	4.8.0	\N	\N	5856441306
9.0.1-add-index-to-events	keycloak	META-INF/jpa-changelog-9.0.1.xml	2022-10-15 17:54:04.161978	85	EXECUTED	8:ab4f863f39adafd4c862f7ec01890abc	createIndex indexName=IDX_EVENT_TIME, tableName=EVENT_ENTITY		\N	4.8.0	\N	\N	5856441306
map-remove-ri	keycloak	META-INF/jpa-changelog-11.0.0.xml	2022-10-15 17:54:04.169028	86	EXECUTED	8:13c419a0eb336e91ee3a3bf8fda6e2a7	dropForeignKeyConstraint baseTableName=REALM, constraintName=FK_TRAF444KK6QRKMS7N56AIWQ5Y; dropForeignKeyConstraint baseTableName=KEYCLOAK_ROLE, constraintName=FK_KJHO5LE2C0RAL09FL8CM9WFW9		\N	4.8.0	\N	\N	5856441306
map-remove-ri	keycloak	META-INF/jpa-changelog-12.0.0.xml	2022-10-15 17:54:04.180043	87	EXECUTED	8:e3fb1e698e0471487f51af1ed80fe3ac	dropForeignKeyConstraint baseTableName=REALM_DEFAULT_GROUPS, constraintName=FK_DEF_GROUPS_GROUP; dropForeignKeyConstraint baseTableName=REALM_DEFAULT_ROLES, constraintName=FK_H4WPD7W4HSOOLNI3H0SW7BTJE; dropForeignKeyConstraint baseTableName=CLIENT...		\N	4.8.0	\N	\N	5856441306
12.1.0-add-realm-localization-table	keycloak	META-INF/jpa-changelog-12.0.0.xml	2022-10-15 17:54:04.190014	88	EXECUTED	8:babadb686aab7b56562817e60bf0abd0	createTable tableName=REALM_LOCALIZATIONS; addPrimaryKey tableName=REALM_LOCALIZATIONS		\N	4.8.0	\N	\N	5856441306
default-roles	keycloak	META-INF/jpa-changelog-13.0.0.xml	2022-10-15 17:54:04.198584	89	EXECUTED	8:72d03345fda8e2f17093d08801947773	addColumn tableName=REALM; customChange		\N	4.8.0	\N	\N	5856441306
default-roles-cleanup	keycloak	META-INF/jpa-changelog-13.0.0.xml	2022-10-15 17:54:04.208408	90	EXECUTED	8:61c9233951bd96ffecd9ba75f7d978a4	dropTable tableName=REALM_DEFAULT_ROLES; dropTable tableName=CLIENT_DEFAULT_ROLES		\N	4.8.0	\N	\N	5856441306
13.0.0-KEYCLOAK-16844	keycloak	META-INF/jpa-changelog-13.0.0.xml	2022-10-15 17:54:04.214672	91	EXECUTED	8:ea82e6ad945cec250af6372767b25525	createIndex indexName=IDX_OFFLINE_USS_PRELOAD, tableName=OFFLINE_USER_SESSION		\N	4.8.0	\N	\N	5856441306
map-remove-ri-13.0.0	keycloak	META-INF/jpa-changelog-13.0.0.xml	2022-10-15 17:54:04.22619	92	EXECUTED	8:d3f4a33f41d960ddacd7e2ef30d126b3	dropForeignKeyConstraint baseTableName=DEFAULT_CLIENT_SCOPE, constraintName=FK_R_DEF_CLI_SCOPE_SCOPE; dropForeignKeyConstraint baseTableName=CLIENT_SCOPE_CLIENT, constraintName=FK_C_CLI_SCOPE_SCOPE; dropForeignKeyConstraint baseTableName=CLIENT_SC...		\N	4.8.0	\N	\N	5856441306
13.0.0-KEYCLOAK-17992-drop-constraints	keycloak	META-INF/jpa-changelog-13.0.0.xml	2022-10-15 17:54:04.228964	93	MARK_RAN	8:1284a27fbd049d65831cb6fc07c8a783	dropPrimaryKey constraintName=C_CLI_SCOPE_BIND, tableName=CLIENT_SCOPE_CLIENT; dropIndex indexName=IDX_CLSCOPE_CL, tableName=CLIENT_SCOPE_CLIENT; dropIndex indexName=IDX_CL_CLSCOPE, tableName=CLIENT_SCOPE_CLIENT		\N	4.8.0	\N	\N	5856441306
13.0.0-increase-column-size-federated	keycloak	META-INF/jpa-changelog-13.0.0.xml	2022-10-15 17:54:04.240367	94	EXECUTED	8:9d11b619db2ae27c25853b8a37cd0dea	modifyDataType columnName=CLIENT_ID, tableName=CLIENT_SCOPE_CLIENT; modifyDataType columnName=SCOPE_ID, tableName=CLIENT_SCOPE_CLIENT		\N	4.8.0	\N	\N	5856441306
13.0.0-KEYCLOAK-17992-recreate-constraints	keycloak	META-INF/jpa-changelog-13.0.0.xml	2022-10-15 17:54:04.242568	95	MARK_RAN	8:3002bb3997451bb9e8bac5c5cd8d6327	addNotNullConstraint columnName=CLIENT_ID, tableName=CLIENT_SCOPE_CLIENT; addNotNullConstraint columnName=SCOPE_ID, tableName=CLIENT_SCOPE_CLIENT; addPrimaryKey constraintName=C_CLI_SCOPE_BIND, tableName=CLIENT_SCOPE_CLIENT; createIndex indexName=...		\N	4.8.0	\N	\N	5856441306
json-string-accomodation-fixed	keycloak	META-INF/jpa-changelog-13.0.0.xml	2022-10-15 17:54:04.249473	96	EXECUTED	8:dfbee0d6237a23ef4ccbb7a4e063c163	addColumn tableName=REALM_ATTRIBUTE; update tableName=REALM_ATTRIBUTE; dropColumn columnName=VALUE, tableName=REALM_ATTRIBUTE; renameColumn newColumnName=VALUE, oldColumnName=VALUE_NEW, tableName=REALM_ATTRIBUTE		\N	4.8.0	\N	\N	5856441306
14.0.0-KEYCLOAK-11019	keycloak	META-INF/jpa-changelog-14.0.0.xml	2022-10-15 17:54:04.260966	97	EXECUTED	8:75f3e372df18d38c62734eebb986b960	createIndex indexName=IDX_OFFLINE_CSS_PRELOAD, tableName=OFFLINE_CLIENT_SESSION; createIndex indexName=IDX_OFFLINE_USS_BY_USER, tableName=OFFLINE_USER_SESSION; createIndex indexName=IDX_OFFLINE_USS_BY_USERSESS, tableName=OFFLINE_USER_SESSION		\N	4.8.0	\N	\N	5856441306
14.0.0-KEYCLOAK-18286	keycloak	META-INF/jpa-changelog-14.0.0.xml	2022-10-15 17:54:04.263345	98	MARK_RAN	8:7fee73eddf84a6035691512c85637eef	createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.8.0	\N	\N	5856441306
14.0.0-KEYCLOAK-18286-revert	keycloak	META-INF/jpa-changelog-14.0.0.xml	2022-10-15 17:54:04.276557	99	MARK_RAN	8:7a11134ab12820f999fbf3bb13c3adc8	dropIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.8.0	\N	\N	5856441306
14.0.0-KEYCLOAK-18286-supported-dbs	keycloak	META-INF/jpa-changelog-14.0.0.xml	2022-10-15 17:54:04.282506	100	EXECUTED	8:c0f6eaac1f3be773ffe54cb5b8482b70	createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.8.0	\N	\N	5856441306
14.0.0-KEYCLOAK-18286-unsupported-dbs	keycloak	META-INF/jpa-changelog-14.0.0.xml	2022-10-15 17:54:04.284945	101	MARK_RAN	8:18186f0008b86e0f0f49b0c4d0e842ac	createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.8.0	\N	\N	5856441306
KEYCLOAK-17267-add-index-to-user-attributes	keycloak	META-INF/jpa-changelog-14.0.0.xml	2022-10-15 17:54:04.290541	102	EXECUTED	8:09c2780bcb23b310a7019d217dc7b433	createIndex indexName=IDX_USER_ATTRIBUTE_NAME, tableName=USER_ATTRIBUTE		\N	4.8.0	\N	\N	5856441306
KEYCLOAK-18146-add-saml-art-binding-identifier	keycloak	META-INF/jpa-changelog-14.0.0.xml	2022-10-15 17:54:04.296898	103	EXECUTED	8:276a44955eab693c970a42880197fff2	customChange		\N	4.8.0	\N	\N	5856441306
15.0.0-KEYCLOAK-18467	keycloak	META-INF/jpa-changelog-15.0.0.xml	2022-10-15 17:54:04.304901	104	EXECUTED	8:ba8ee3b694d043f2bfc1a1079d0760d7	addColumn tableName=REALM_LOCALIZATIONS; update tableName=REALM_LOCALIZATIONS; dropColumn columnName=TEXTS, tableName=REALM_LOCALIZATIONS; renameColumn newColumnName=TEXTS, oldColumnName=TEXTS_NEW, tableName=REALM_LOCALIZATIONS; addNotNullConstrai...		\N	4.8.0	\N	\N	5856441306
17.0.0-9562	keycloak	META-INF/jpa-changelog-17.0.0.xml	2022-10-15 17:54:04.310602	105	EXECUTED	8:5e06b1d75f5d17685485e610c2851b17	createIndex indexName=IDX_USER_SERVICE_ACCOUNT, tableName=USER_ENTITY		\N	4.8.0	\N	\N	5856441306
18.0.0-10625-IDX_ADMIN_EVENT_TIME	keycloak	META-INF/jpa-changelog-18.0.0.xml	2022-10-15 17:54:04.315539	106	EXECUTED	8:4b80546c1dc550ac552ee7b24a4ab7c0	createIndex indexName=IDX_ADMIN_EVENT_TIME, tableName=ADMIN_EVENT_ENTITY		\N	4.8.0	\N	\N	5856441306
19.0.0-10135	keycloak	META-INF/jpa-changelog-19.0.0.xml	2022-10-15 17:54:04.321483	107	EXECUTED	8:af510cd1bb2ab6339c45372f3e491696	customChange		\N	4.8.0	\N	\N	5856441306
\.


--
-- Data for Name: databasechangeloglock; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.databasechangeloglock (id, locked, lockgranted, lockedby) FROM stdin;
1	f	\N	\N
1000	f	\N	\N
1001	f	\N	\N
\.


--
-- Data for Name: default_client_scope; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.default_client_scope (realm_id, scope_id, default_scope) FROM stdin;
fd4a6218-c54d-4a98-bddb-08dba17ec4ef	19e436ae-6a03-4232-ab45-d7c47e0287d2	f
fd4a6218-c54d-4a98-bddb-08dba17ec4ef	ae2bdc00-b717-47d2-93db-86a86fa2d20a	t
fd4a6218-c54d-4a98-bddb-08dba17ec4ef	f7ddb717-1874-47bb-89b9-ea361c870f3d	t
fd4a6218-c54d-4a98-bddb-08dba17ec4ef	a9d98b27-1b70-484f-8db3-3600797170e1	t
fd4a6218-c54d-4a98-bddb-08dba17ec4ef	a9dc1e53-964a-4a71-9c82-da718caf3ea6	f
fd4a6218-c54d-4a98-bddb-08dba17ec4ef	252698df-d395-439e-9f78-937674264570	f
fd4a6218-c54d-4a98-bddb-08dba17ec4ef	faa16604-5520-4de3-9f70-38170b43556c	t
fd4a6218-c54d-4a98-bddb-08dba17ec4ef	99564569-211d-4a3c-8005-546a27e27d15	t
fd4a6218-c54d-4a98-bddb-08dba17ec4ef	4fb21183-5248-4ee7-acd6-82a4b16db221	f
fd4a6218-c54d-4a98-bddb-08dba17ec4ef	c17ab933-1a12-4559-aaf9-39f7bcc01297	t
a5069552-e930-4472-8a7f-facf76e3e7f5	74bf69a7-fe38-4b19-9bb8-60345762a515	f
a5069552-e930-4472-8a7f-facf76e3e7f5	5d59705f-f2f4-4a72-9cf6-9aad1360d792	t
a5069552-e930-4472-8a7f-facf76e3e7f5	f3ce69fa-aeb3-4cb8-9759-67a3372f0c63	t
a5069552-e930-4472-8a7f-facf76e3e7f5	c4b6a356-2906-4a17-9546-507476cf81d5	t
a5069552-e930-4472-8a7f-facf76e3e7f5	25958312-9f42-4f0d-9b4f-e5a68e4f830e	f
a5069552-e930-4472-8a7f-facf76e3e7f5	538115b2-78c6-4efb-afe5-ed60f57e671c	f
a5069552-e930-4472-8a7f-facf76e3e7f5	d9ff9f93-fc8c-4b50-a10a-a9e4739d96f3	t
a5069552-e930-4472-8a7f-facf76e3e7f5	ae1e5ac4-048e-4636-a609-e1d85fa04219	t
a5069552-e930-4472-8a7f-facf76e3e7f5	97ebab9a-b654-46f7-ba13-258a628b40b0	f
a5069552-e930-4472-8a7f-facf76e3e7f5	599c454c-a0c0-41a2-b620-3dc847990c5c	t
\.


--
-- Data for Name: event_entity; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.event_entity (id, client_id, details_json, error, ip_address, realm_id, session_id, event_time, type, user_id) FROM stdin;
\.


--
-- Data for Name: fed_user_attribute; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.fed_user_attribute (id, name, user_id, realm_id, storage_provider_id, value) FROM stdin;
\.


--
-- Data for Name: fed_user_consent; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.fed_user_consent (id, client_id, user_id, realm_id, storage_provider_id, created_date, last_updated_date, client_storage_provider, external_client_id) FROM stdin;
\.


--
-- Data for Name: fed_user_consent_cl_scope; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.fed_user_consent_cl_scope (user_consent_id, scope_id) FROM stdin;
\.


--
-- Data for Name: fed_user_credential; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.fed_user_credential (id, salt, type, created_date, user_id, realm_id, storage_provider_id, user_label, secret_data, credential_data, priority) FROM stdin;
\.


--
-- Data for Name: fed_user_group_membership; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.fed_user_group_membership (group_id, user_id, realm_id, storage_provider_id) FROM stdin;
\.


--
-- Data for Name: fed_user_required_action; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.fed_user_required_action (required_action, user_id, realm_id, storage_provider_id) FROM stdin;
\.


--
-- Data for Name: fed_user_role_mapping; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.fed_user_role_mapping (role_id, user_id, realm_id, storage_provider_id) FROM stdin;
\.


--
-- Data for Name: federated_identity; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.federated_identity (identity_provider, realm_id, federated_user_id, federated_username, token, user_id) FROM stdin;
\.


--
-- Data for Name: federated_user; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.federated_user (id, storage_provider_id, realm_id) FROM stdin;
\.


--
-- Data for Name: group_attribute; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.group_attribute (id, name, value, group_id) FROM stdin;
\.


--
-- Data for Name: group_role_mapping; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.group_role_mapping (role_id, group_id) FROM stdin;
\.


--
-- Data for Name: identity_provider; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.identity_provider (internal_id, enabled, provider_alias, provider_id, store_token, authenticate_by_default, realm_id, add_token_role, trust_email, first_broker_login_flow_id, post_broker_login_flow_id, provider_display_name, link_only) FROM stdin;
\.


--
-- Data for Name: identity_provider_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.identity_provider_config (identity_provider_id, value, name) FROM stdin;
\.


--
-- Data for Name: identity_provider_mapper; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.identity_provider_mapper (id, name, idp_alias, idp_mapper_name, realm_id) FROM stdin;
\.


--
-- Data for Name: idp_mapper_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.idp_mapper_config (idp_mapper_id, value, name) FROM stdin;
\.


--
-- Data for Name: keycloak_group; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.keycloak_group (id, name, parent_group, realm_id) FROM stdin;
\.


--
-- Data for Name: keycloak_role; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) FROM stdin;
0bede6dd-e745-421f-a443-e2363d61f5e2	fd4a6218-c54d-4a98-bddb-08dba17ec4ef	f	${role_default-roles}	default-roles-master	fd4a6218-c54d-4a98-bddb-08dba17ec4ef	\N	\N
3fb6e99e-07c7-460b-8a3d-5031c6461ffe	fd4a6218-c54d-4a98-bddb-08dba17ec4ef	f	${role_create-realm}	create-realm	fd4a6218-c54d-4a98-bddb-08dba17ec4ef	\N	\N
cfc3fb84-f97b-410d-b816-711da8ba6815	fd4a6218-c54d-4a98-bddb-08dba17ec4ef	f	${role_admin}	admin	fd4a6218-c54d-4a98-bddb-08dba17ec4ef	\N	\N
55e365c0-8c1f-4524-a955-5722246a9571	20a47e58-c362-40ef-ba05-16037dbaf30e	t	${role_create-client}	create-client	fd4a6218-c54d-4a98-bddb-08dba17ec4ef	20a47e58-c362-40ef-ba05-16037dbaf30e	\N
8f18e445-aa94-453c-95bd-01b5c0347e48	20a47e58-c362-40ef-ba05-16037dbaf30e	t	${role_view-realm}	view-realm	fd4a6218-c54d-4a98-bddb-08dba17ec4ef	20a47e58-c362-40ef-ba05-16037dbaf30e	\N
298dab0c-471c-4ac4-bf21-a7475a2c3f78	20a47e58-c362-40ef-ba05-16037dbaf30e	t	${role_view-users}	view-users	fd4a6218-c54d-4a98-bddb-08dba17ec4ef	20a47e58-c362-40ef-ba05-16037dbaf30e	\N
885fec8d-986d-4235-9c94-113706a2f92d	20a47e58-c362-40ef-ba05-16037dbaf30e	t	${role_view-clients}	view-clients	fd4a6218-c54d-4a98-bddb-08dba17ec4ef	20a47e58-c362-40ef-ba05-16037dbaf30e	\N
13a207f7-672c-4919-9746-476a06055627	20a47e58-c362-40ef-ba05-16037dbaf30e	t	${role_view-events}	view-events	fd4a6218-c54d-4a98-bddb-08dba17ec4ef	20a47e58-c362-40ef-ba05-16037dbaf30e	\N
f1e392c1-c0af-40ac-b921-eab6765586b0	20a47e58-c362-40ef-ba05-16037dbaf30e	t	${role_view-identity-providers}	view-identity-providers	fd4a6218-c54d-4a98-bddb-08dba17ec4ef	20a47e58-c362-40ef-ba05-16037dbaf30e	\N
d525217e-9fe0-4ea7-8a5c-27690fb3fb12	20a47e58-c362-40ef-ba05-16037dbaf30e	t	${role_view-authorization}	view-authorization	fd4a6218-c54d-4a98-bddb-08dba17ec4ef	20a47e58-c362-40ef-ba05-16037dbaf30e	\N
4cd69517-246f-449b-81cc-ad0530194bb9	20a47e58-c362-40ef-ba05-16037dbaf30e	t	${role_manage-realm}	manage-realm	fd4a6218-c54d-4a98-bddb-08dba17ec4ef	20a47e58-c362-40ef-ba05-16037dbaf30e	\N
672d071c-b5be-4bae-9a76-e5d0ecaf30c2	20a47e58-c362-40ef-ba05-16037dbaf30e	t	${role_manage-users}	manage-users	fd4a6218-c54d-4a98-bddb-08dba17ec4ef	20a47e58-c362-40ef-ba05-16037dbaf30e	\N
6f0e2d62-9636-4626-9012-84acb71af193	20a47e58-c362-40ef-ba05-16037dbaf30e	t	${role_manage-clients}	manage-clients	fd4a6218-c54d-4a98-bddb-08dba17ec4ef	20a47e58-c362-40ef-ba05-16037dbaf30e	\N
a848a573-9d2a-4aa7-8832-cc40862b40b9	20a47e58-c362-40ef-ba05-16037dbaf30e	t	${role_manage-events}	manage-events	fd4a6218-c54d-4a98-bddb-08dba17ec4ef	20a47e58-c362-40ef-ba05-16037dbaf30e	\N
6b57a6e7-b683-419e-befb-5e0226cd9933	20a47e58-c362-40ef-ba05-16037dbaf30e	t	${role_manage-identity-providers}	manage-identity-providers	fd4a6218-c54d-4a98-bddb-08dba17ec4ef	20a47e58-c362-40ef-ba05-16037dbaf30e	\N
03b9a427-1fef-4cdc-bd4c-b5a455a9da94	20a47e58-c362-40ef-ba05-16037dbaf30e	t	${role_manage-authorization}	manage-authorization	fd4a6218-c54d-4a98-bddb-08dba17ec4ef	20a47e58-c362-40ef-ba05-16037dbaf30e	\N
1372ad25-219c-4982-b685-c008980fed28	20a47e58-c362-40ef-ba05-16037dbaf30e	t	${role_query-users}	query-users	fd4a6218-c54d-4a98-bddb-08dba17ec4ef	20a47e58-c362-40ef-ba05-16037dbaf30e	\N
cdbbe31a-6f4c-44dd-aca2-2d24aae895f4	20a47e58-c362-40ef-ba05-16037dbaf30e	t	${role_query-clients}	query-clients	fd4a6218-c54d-4a98-bddb-08dba17ec4ef	20a47e58-c362-40ef-ba05-16037dbaf30e	\N
d3f0b1f1-04b6-443b-9481-9455be811a87	20a47e58-c362-40ef-ba05-16037dbaf30e	t	${role_query-realms}	query-realms	fd4a6218-c54d-4a98-bddb-08dba17ec4ef	20a47e58-c362-40ef-ba05-16037dbaf30e	\N
6e0b9809-20ae-4965-9b38-0d0821febac3	20a47e58-c362-40ef-ba05-16037dbaf30e	t	${role_query-groups}	query-groups	fd4a6218-c54d-4a98-bddb-08dba17ec4ef	20a47e58-c362-40ef-ba05-16037dbaf30e	\N
2fc339b9-4b7d-4699-bbe7-fd60338cb100	cccb0307-df62-466f-a9f0-3813069d9c6c	t	${role_view-profile}	view-profile	fd4a6218-c54d-4a98-bddb-08dba17ec4ef	cccb0307-df62-466f-a9f0-3813069d9c6c	\N
1afb9cf1-486e-4ffd-8685-d222f10eec5e	cccb0307-df62-466f-a9f0-3813069d9c6c	t	${role_manage-account}	manage-account	fd4a6218-c54d-4a98-bddb-08dba17ec4ef	cccb0307-df62-466f-a9f0-3813069d9c6c	\N
2cf6c764-b378-4b6b-a398-75676b9fe4df	cccb0307-df62-466f-a9f0-3813069d9c6c	t	${role_manage-account-links}	manage-account-links	fd4a6218-c54d-4a98-bddb-08dba17ec4ef	cccb0307-df62-466f-a9f0-3813069d9c6c	\N
2371781d-f971-42e6-a564-3223eea883bb	cccb0307-df62-466f-a9f0-3813069d9c6c	t	${role_view-applications}	view-applications	fd4a6218-c54d-4a98-bddb-08dba17ec4ef	cccb0307-df62-466f-a9f0-3813069d9c6c	\N
8dd03112-6e82-42cd-af80-b9dd53f0d358	cccb0307-df62-466f-a9f0-3813069d9c6c	t	${role_view-consent}	view-consent	fd4a6218-c54d-4a98-bddb-08dba17ec4ef	cccb0307-df62-466f-a9f0-3813069d9c6c	\N
1b632039-f301-4e9c-83b8-f16997a23951	cccb0307-df62-466f-a9f0-3813069d9c6c	t	${role_manage-consent}	manage-consent	fd4a6218-c54d-4a98-bddb-08dba17ec4ef	cccb0307-df62-466f-a9f0-3813069d9c6c	\N
9345ce25-6b07-4f76-b281-840396b81ee3	cccb0307-df62-466f-a9f0-3813069d9c6c	t	${role_delete-account}	delete-account	fd4a6218-c54d-4a98-bddb-08dba17ec4ef	cccb0307-df62-466f-a9f0-3813069d9c6c	\N
6b40f47a-a4f8-4a54-8570-7c02431f1f54	381c4fa8-47ee-4b0e-b5b2-0cfb99e7f168	t	${role_read-token}	read-token	fd4a6218-c54d-4a98-bddb-08dba17ec4ef	381c4fa8-47ee-4b0e-b5b2-0cfb99e7f168	\N
69f92697-af51-4ca7-8920-abd7749f3020	20a47e58-c362-40ef-ba05-16037dbaf30e	t	${role_impersonation}	impersonation	fd4a6218-c54d-4a98-bddb-08dba17ec4ef	20a47e58-c362-40ef-ba05-16037dbaf30e	\N
3fca2cc6-4cbc-4b55-b084-74831af2a493	fd4a6218-c54d-4a98-bddb-08dba17ec4ef	f	${role_offline-access}	offline_access	fd4a6218-c54d-4a98-bddb-08dba17ec4ef	\N	\N
d077e162-6b0f-4c58-9f52-63a426d17e14	fd4a6218-c54d-4a98-bddb-08dba17ec4ef	f	${role_uma_authorization}	uma_authorization	fd4a6218-c54d-4a98-bddb-08dba17ec4ef	\N	\N
acff3968-4e16-483c-9471-b13b5ff72b18	a5069552-e930-4472-8a7f-facf76e3e7f5	f	${role_default-roles}	default-roles-benchmark	a5069552-e930-4472-8a7f-facf76e3e7f5	\N	\N
08696078-5f3f-48f9-987a-793c6203fcdf	9c38e015-a478-4c19-ab1a-0818711f31c4	t	${role_create-client}	create-client	fd4a6218-c54d-4a98-bddb-08dba17ec4ef	9c38e015-a478-4c19-ab1a-0818711f31c4	\N
f32deb0a-53e5-42d2-a518-c6bb3ea5637b	9c38e015-a478-4c19-ab1a-0818711f31c4	t	${role_view-realm}	view-realm	fd4a6218-c54d-4a98-bddb-08dba17ec4ef	9c38e015-a478-4c19-ab1a-0818711f31c4	\N
d487d81c-3064-4007-b9b3-e45a17e30992	9c38e015-a478-4c19-ab1a-0818711f31c4	t	${role_view-users}	view-users	fd4a6218-c54d-4a98-bddb-08dba17ec4ef	9c38e015-a478-4c19-ab1a-0818711f31c4	\N
cf956566-3266-4418-a10d-60dbef1cf94d	9c38e015-a478-4c19-ab1a-0818711f31c4	t	${role_view-clients}	view-clients	fd4a6218-c54d-4a98-bddb-08dba17ec4ef	9c38e015-a478-4c19-ab1a-0818711f31c4	\N
660a287c-531e-4f78-8785-aabbf3c4753a	9c38e015-a478-4c19-ab1a-0818711f31c4	t	${role_view-events}	view-events	fd4a6218-c54d-4a98-bddb-08dba17ec4ef	9c38e015-a478-4c19-ab1a-0818711f31c4	\N
a488e284-69e2-4f26-9215-0c6b0db16865	9c38e015-a478-4c19-ab1a-0818711f31c4	t	${role_view-identity-providers}	view-identity-providers	fd4a6218-c54d-4a98-bddb-08dba17ec4ef	9c38e015-a478-4c19-ab1a-0818711f31c4	\N
fdd96fdd-3a77-4429-9703-19cd07a0c1bc	9c38e015-a478-4c19-ab1a-0818711f31c4	t	${role_view-authorization}	view-authorization	fd4a6218-c54d-4a98-bddb-08dba17ec4ef	9c38e015-a478-4c19-ab1a-0818711f31c4	\N
8929cc25-b7b9-4070-85ed-a2b22361260f	9c38e015-a478-4c19-ab1a-0818711f31c4	t	${role_manage-realm}	manage-realm	fd4a6218-c54d-4a98-bddb-08dba17ec4ef	9c38e015-a478-4c19-ab1a-0818711f31c4	\N
dc091829-dd67-4972-86ce-a22926a00861	9c38e015-a478-4c19-ab1a-0818711f31c4	t	${role_manage-users}	manage-users	fd4a6218-c54d-4a98-bddb-08dba17ec4ef	9c38e015-a478-4c19-ab1a-0818711f31c4	\N
7757473c-b2d3-4d0a-9cc8-7a4ae5c8cfc8	9c38e015-a478-4c19-ab1a-0818711f31c4	t	${role_manage-clients}	manage-clients	fd4a6218-c54d-4a98-bddb-08dba17ec4ef	9c38e015-a478-4c19-ab1a-0818711f31c4	\N
4656fae1-1934-4374-b611-a9ad08310662	9c38e015-a478-4c19-ab1a-0818711f31c4	t	${role_manage-events}	manage-events	fd4a6218-c54d-4a98-bddb-08dba17ec4ef	9c38e015-a478-4c19-ab1a-0818711f31c4	\N
d9bf51c0-84d8-497c-a11d-0017a29d7ec3	9c38e015-a478-4c19-ab1a-0818711f31c4	t	${role_manage-identity-providers}	manage-identity-providers	fd4a6218-c54d-4a98-bddb-08dba17ec4ef	9c38e015-a478-4c19-ab1a-0818711f31c4	\N
d4d0c6bb-bf39-43bc-aade-37b8be7edb34	9c38e015-a478-4c19-ab1a-0818711f31c4	t	${role_manage-authorization}	manage-authorization	fd4a6218-c54d-4a98-bddb-08dba17ec4ef	9c38e015-a478-4c19-ab1a-0818711f31c4	\N
a1fc3916-b33f-4546-b3e2-880c5e1fc03e	9c38e015-a478-4c19-ab1a-0818711f31c4	t	${role_query-users}	query-users	fd4a6218-c54d-4a98-bddb-08dba17ec4ef	9c38e015-a478-4c19-ab1a-0818711f31c4	\N
b84c39a4-b5d4-4e62-a6a4-61accd5074c3	9c38e015-a478-4c19-ab1a-0818711f31c4	t	${role_query-clients}	query-clients	fd4a6218-c54d-4a98-bddb-08dba17ec4ef	9c38e015-a478-4c19-ab1a-0818711f31c4	\N
9c6cc7c7-4f14-4de4-bf24-811adc5768e7	9c38e015-a478-4c19-ab1a-0818711f31c4	t	${role_query-realms}	query-realms	fd4a6218-c54d-4a98-bddb-08dba17ec4ef	9c38e015-a478-4c19-ab1a-0818711f31c4	\N
ac35566d-7538-4eab-a1fa-cbc6096b527f	9c38e015-a478-4c19-ab1a-0818711f31c4	t	${role_query-groups}	query-groups	fd4a6218-c54d-4a98-bddb-08dba17ec4ef	9c38e015-a478-4c19-ab1a-0818711f31c4	\N
836e66c8-0174-4787-96c3-a0ca95a667b5	9db59d89-b318-48a4-8def-abec5b60607c	t	${role_realm-admin}	realm-admin	a5069552-e930-4472-8a7f-facf76e3e7f5	9db59d89-b318-48a4-8def-abec5b60607c	\N
9389327d-b475-45a6-b123-d93dd8498a0b	9db59d89-b318-48a4-8def-abec5b60607c	t	${role_create-client}	create-client	a5069552-e930-4472-8a7f-facf76e3e7f5	9db59d89-b318-48a4-8def-abec5b60607c	\N
3acaf0cf-025a-47ac-94ec-7925bd09c20b	9db59d89-b318-48a4-8def-abec5b60607c	t	${role_view-realm}	view-realm	a5069552-e930-4472-8a7f-facf76e3e7f5	9db59d89-b318-48a4-8def-abec5b60607c	\N
29dc5e64-5091-4bc3-a149-27e82ca6c974	9db59d89-b318-48a4-8def-abec5b60607c	t	${role_view-users}	view-users	a5069552-e930-4472-8a7f-facf76e3e7f5	9db59d89-b318-48a4-8def-abec5b60607c	\N
bb361804-707e-4b7e-beef-88bc06fb5310	9db59d89-b318-48a4-8def-abec5b60607c	t	${role_view-clients}	view-clients	a5069552-e930-4472-8a7f-facf76e3e7f5	9db59d89-b318-48a4-8def-abec5b60607c	\N
89021d3e-21ff-4425-944f-a9ea63901c45	9db59d89-b318-48a4-8def-abec5b60607c	t	${role_view-events}	view-events	a5069552-e930-4472-8a7f-facf76e3e7f5	9db59d89-b318-48a4-8def-abec5b60607c	\N
25fcff83-84b1-402a-b796-2447f7142fff	9db59d89-b318-48a4-8def-abec5b60607c	t	${role_view-identity-providers}	view-identity-providers	a5069552-e930-4472-8a7f-facf76e3e7f5	9db59d89-b318-48a4-8def-abec5b60607c	\N
11ce66da-b699-484e-8ce7-6a3f2d8cd21a	9db59d89-b318-48a4-8def-abec5b60607c	t	${role_view-authorization}	view-authorization	a5069552-e930-4472-8a7f-facf76e3e7f5	9db59d89-b318-48a4-8def-abec5b60607c	\N
d3dcd1d1-88dd-47bc-b34f-de831f8f76b2	9db59d89-b318-48a4-8def-abec5b60607c	t	${role_manage-realm}	manage-realm	a5069552-e930-4472-8a7f-facf76e3e7f5	9db59d89-b318-48a4-8def-abec5b60607c	\N
93ed949d-2ae1-493c-8e40-7a1a3382893f	9db59d89-b318-48a4-8def-abec5b60607c	t	${role_manage-users}	manage-users	a5069552-e930-4472-8a7f-facf76e3e7f5	9db59d89-b318-48a4-8def-abec5b60607c	\N
e6708c3b-b25b-4a16-8049-0f5c3af9e360	9db59d89-b318-48a4-8def-abec5b60607c	t	${role_manage-clients}	manage-clients	a5069552-e930-4472-8a7f-facf76e3e7f5	9db59d89-b318-48a4-8def-abec5b60607c	\N
bb627965-83b7-45d9-a4a6-9d22d788b511	9db59d89-b318-48a4-8def-abec5b60607c	t	${role_manage-events}	manage-events	a5069552-e930-4472-8a7f-facf76e3e7f5	9db59d89-b318-48a4-8def-abec5b60607c	\N
3ba4a1c5-82ce-4f16-9eb6-4062e9ac2c4a	9db59d89-b318-48a4-8def-abec5b60607c	t	${role_manage-identity-providers}	manage-identity-providers	a5069552-e930-4472-8a7f-facf76e3e7f5	9db59d89-b318-48a4-8def-abec5b60607c	\N
45f5d57f-c3f5-4944-a93b-056d7e942140	9db59d89-b318-48a4-8def-abec5b60607c	t	${role_manage-authorization}	manage-authorization	a5069552-e930-4472-8a7f-facf76e3e7f5	9db59d89-b318-48a4-8def-abec5b60607c	\N
37f2f5a4-6bf0-4cb0-bef0-168a514d5b29	9db59d89-b318-48a4-8def-abec5b60607c	t	${role_query-users}	query-users	a5069552-e930-4472-8a7f-facf76e3e7f5	9db59d89-b318-48a4-8def-abec5b60607c	\N
055644d3-4ecf-4871-8f9c-2082c185f3dc	9db59d89-b318-48a4-8def-abec5b60607c	t	${role_query-clients}	query-clients	a5069552-e930-4472-8a7f-facf76e3e7f5	9db59d89-b318-48a4-8def-abec5b60607c	\N
c49ea7bf-ffe2-4b8a-95cb-297beb0f351d	9db59d89-b318-48a4-8def-abec5b60607c	t	${role_query-realms}	query-realms	a5069552-e930-4472-8a7f-facf76e3e7f5	9db59d89-b318-48a4-8def-abec5b60607c	\N
07b47704-25fd-425e-b972-bc7e088ce837	9db59d89-b318-48a4-8def-abec5b60607c	t	${role_query-groups}	query-groups	a5069552-e930-4472-8a7f-facf76e3e7f5	9db59d89-b318-48a4-8def-abec5b60607c	\N
269866ce-df68-4cff-b4a2-7f91ff8c0d32	c8389924-e7d6-4232-b74d-de63f8d43745	t	${role_view-profile}	view-profile	a5069552-e930-4472-8a7f-facf76e3e7f5	c8389924-e7d6-4232-b74d-de63f8d43745	\N
73804fa0-9183-42fe-a3a5-1060ca7425e3	c8389924-e7d6-4232-b74d-de63f8d43745	t	${role_manage-account}	manage-account	a5069552-e930-4472-8a7f-facf76e3e7f5	c8389924-e7d6-4232-b74d-de63f8d43745	\N
e0947fb3-cda1-4c6b-a1d9-b11ff69523b9	c8389924-e7d6-4232-b74d-de63f8d43745	t	${role_manage-account-links}	manage-account-links	a5069552-e930-4472-8a7f-facf76e3e7f5	c8389924-e7d6-4232-b74d-de63f8d43745	\N
d64f07a7-ea86-491f-b9ae-004ba2259d76	c8389924-e7d6-4232-b74d-de63f8d43745	t	${role_view-applications}	view-applications	a5069552-e930-4472-8a7f-facf76e3e7f5	c8389924-e7d6-4232-b74d-de63f8d43745	\N
1bdfc84e-0617-4c7d-a06c-84fc2359bd2f	c8389924-e7d6-4232-b74d-de63f8d43745	t	${role_view-consent}	view-consent	a5069552-e930-4472-8a7f-facf76e3e7f5	c8389924-e7d6-4232-b74d-de63f8d43745	\N
af7c0699-9a22-4e39-ba40-b61c4aedf225	c8389924-e7d6-4232-b74d-de63f8d43745	t	${role_manage-consent}	manage-consent	a5069552-e930-4472-8a7f-facf76e3e7f5	c8389924-e7d6-4232-b74d-de63f8d43745	\N
8e8a99e6-9574-4ee4-9c68-7e69f07e0fe5	c8389924-e7d6-4232-b74d-de63f8d43745	t	${role_delete-account}	delete-account	a5069552-e930-4472-8a7f-facf76e3e7f5	c8389924-e7d6-4232-b74d-de63f8d43745	\N
3ad145aa-1643-41e0-a012-ba5d6d4919d3	9c38e015-a478-4c19-ab1a-0818711f31c4	t	${role_impersonation}	impersonation	fd4a6218-c54d-4a98-bddb-08dba17ec4ef	9c38e015-a478-4c19-ab1a-0818711f31c4	\N
44041310-01bd-4c95-aa34-b47d65116ddd	9db59d89-b318-48a4-8def-abec5b60607c	t	${role_impersonation}	impersonation	a5069552-e930-4472-8a7f-facf76e3e7f5	9db59d89-b318-48a4-8def-abec5b60607c	\N
5a3fc324-5bf1-4e08-bb8d-b8fd8819252f	70991b29-bf4b-4882-a292-457465b3e05c	t	${role_read-token}	read-token	a5069552-e930-4472-8a7f-facf76e3e7f5	70991b29-bf4b-4882-a292-457465b3e05c	\N
882ae7d2-6524-47a6-b123-b2f658c7de64	a5069552-e930-4472-8a7f-facf76e3e7f5	f	${role_offline-access}	offline_access	a5069552-e930-4472-8a7f-facf76e3e7f5	\N	\N
98c4277b-291c-4ced-9b16-10165366d5ad	a5069552-e930-4472-8a7f-facf76e3e7f5	f	${role_uma_authorization}	uma_authorization	a5069552-e930-4472-8a7f-facf76e3e7f5	\N	\N
\.


--
-- Data for Name: migration_model; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.migration_model (id, version, update_time) FROM stdin;
fwl2a	19.0.1	1665856444
\.


--
-- Data for Name: offline_client_session; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.offline_client_session (user_session_id, client_id, offline_flag, "timestamp", data, client_storage_provider, external_client_id) FROM stdin;
\.


--
-- Data for Name: offline_user_session; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.offline_user_session (user_session_id, user_id, realm_id, created_on, offline_flag, data, last_session_refresh) FROM stdin;
\.


--
-- Data for Name: policy_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.policy_config (policy_id, name, value) FROM stdin;
\.


--
-- Data for Name: protocol_mapper; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) FROM stdin;
682206d5-82d2-455a-af7f-42835fa36b47	audience resolve	openid-connect	oidc-audience-resolve-mapper	89edf3fc-ecca-4425-a996-45dd9e45834d	\N
e321f22f-2460-4ca8-8ebb-f91ce87f6694	locale	openid-connect	oidc-usermodel-attribute-mapper	42f58925-9b32-4d59-8fb3-f9ec959c68ae	\N
2dfddfb9-4e19-4016-95fb-093c8e023d03	role list	saml	saml-role-list-mapper	\N	ae2bdc00-b717-47d2-93db-86a86fa2d20a
c5adc642-6579-4b87-acc3-e463dfa8c566	full name	openid-connect	oidc-full-name-mapper	\N	f7ddb717-1874-47bb-89b9-ea361c870f3d
b7085169-8c3d-42c1-b69c-0af6715a9a3b	family name	openid-connect	oidc-usermodel-property-mapper	\N	f7ddb717-1874-47bb-89b9-ea361c870f3d
86f17df8-9689-4867-ba0a-2d824470f017	given name	openid-connect	oidc-usermodel-property-mapper	\N	f7ddb717-1874-47bb-89b9-ea361c870f3d
6a508c5b-682b-4d24-8108-fd1b3ad47dc9	middle name	openid-connect	oidc-usermodel-attribute-mapper	\N	f7ddb717-1874-47bb-89b9-ea361c870f3d
583423b5-f768-4863-829c-1e43c6796301	nickname	openid-connect	oidc-usermodel-attribute-mapper	\N	f7ddb717-1874-47bb-89b9-ea361c870f3d
f14ff452-e3c6-4b38-9acb-7cfecdea802b	username	openid-connect	oidc-usermodel-property-mapper	\N	f7ddb717-1874-47bb-89b9-ea361c870f3d
b30d6f94-3559-4832-97c7-39e628776dc7	profile	openid-connect	oidc-usermodel-attribute-mapper	\N	f7ddb717-1874-47bb-89b9-ea361c870f3d
3e20b7df-355d-4557-9642-31185051258d	picture	openid-connect	oidc-usermodel-attribute-mapper	\N	f7ddb717-1874-47bb-89b9-ea361c870f3d
8d520a93-9208-49b6-a355-e99e3875b787	website	openid-connect	oidc-usermodel-attribute-mapper	\N	f7ddb717-1874-47bb-89b9-ea361c870f3d
11789775-604f-43f2-bf15-5e9ecc6d8b24	gender	openid-connect	oidc-usermodel-attribute-mapper	\N	f7ddb717-1874-47bb-89b9-ea361c870f3d
ee3d676d-601f-4676-83a2-06848af2629c	birthdate	openid-connect	oidc-usermodel-attribute-mapper	\N	f7ddb717-1874-47bb-89b9-ea361c870f3d
e9890472-5173-423b-8dd7-5c3a9bed71b4	zoneinfo	openid-connect	oidc-usermodel-attribute-mapper	\N	f7ddb717-1874-47bb-89b9-ea361c870f3d
5e6f3b54-c907-457b-931e-677f560d6ca5	locale	openid-connect	oidc-usermodel-attribute-mapper	\N	f7ddb717-1874-47bb-89b9-ea361c870f3d
b77349a4-8d65-47b9-bcac-abd9ee5c1de8	updated at	openid-connect	oidc-usermodel-attribute-mapper	\N	f7ddb717-1874-47bb-89b9-ea361c870f3d
d6a24cb6-2682-4e15-b97d-7880412353a4	email	openid-connect	oidc-usermodel-property-mapper	\N	a9d98b27-1b70-484f-8db3-3600797170e1
ef2790b4-9031-461f-ac6e-c708269559d2	email verified	openid-connect	oidc-usermodel-property-mapper	\N	a9d98b27-1b70-484f-8db3-3600797170e1
330d88b4-ba25-4892-972b-c6c0647233a2	address	openid-connect	oidc-address-mapper	\N	a9dc1e53-964a-4a71-9c82-da718caf3ea6
1fd3f020-ebed-4518-8e1f-756c6860858e	phone number	openid-connect	oidc-usermodel-attribute-mapper	\N	252698df-d395-439e-9f78-937674264570
c748a2df-7d60-44fe-b814-45a6b76b42b0	phone number verified	openid-connect	oidc-usermodel-attribute-mapper	\N	252698df-d395-439e-9f78-937674264570
38c6229e-9d7e-44c3-bf35-60981eea62ab	realm roles	openid-connect	oidc-usermodel-realm-role-mapper	\N	faa16604-5520-4de3-9f70-38170b43556c
7e735409-9863-4e10-8202-03879b88493e	client roles	openid-connect	oidc-usermodel-client-role-mapper	\N	faa16604-5520-4de3-9f70-38170b43556c
0a03205d-097d-40c0-bf38-b9b874070824	audience resolve	openid-connect	oidc-audience-resolve-mapper	\N	faa16604-5520-4de3-9f70-38170b43556c
8ab59566-c2d5-4ee8-a4bf-446d6ab4d335	allowed web origins	openid-connect	oidc-allowed-origins-mapper	\N	99564569-211d-4a3c-8005-546a27e27d15
33025727-f9df-463b-bb70-8e5526b27f21	upn	openid-connect	oidc-usermodel-property-mapper	\N	4fb21183-5248-4ee7-acd6-82a4b16db221
1f506afb-acb5-4dcc-b1b5-bbb906911cbc	groups	openid-connect	oidc-usermodel-realm-role-mapper	\N	4fb21183-5248-4ee7-acd6-82a4b16db221
0605dc19-1afd-4f3a-8565-25b3289d0c20	acr loa level	openid-connect	oidc-acr-mapper	\N	c17ab933-1a12-4559-aaf9-39f7bcc01297
dec88812-8ad3-4e37-bf75-3a3024313d1f	audience resolve	openid-connect	oidc-audience-resolve-mapper	6b5f11f3-9d21-4984-b7b1-5eb23612e671	\N
d155fcee-b180-46ac-bd2c-30f80b57e129	role list	saml	saml-role-list-mapper	\N	5d59705f-f2f4-4a72-9cf6-9aad1360d792
82a2e459-977c-45b2-b56f-0f545d3bf710	full name	openid-connect	oidc-full-name-mapper	\N	f3ce69fa-aeb3-4cb8-9759-67a3372f0c63
3651db32-7768-48ea-bd5e-d4dc149aba76	family name	openid-connect	oidc-usermodel-property-mapper	\N	f3ce69fa-aeb3-4cb8-9759-67a3372f0c63
a916165d-2811-41f6-bef5-cc4f10d8b9dd	given name	openid-connect	oidc-usermodel-property-mapper	\N	f3ce69fa-aeb3-4cb8-9759-67a3372f0c63
1b0bfc64-0483-458d-85bc-810504d9e82d	middle name	openid-connect	oidc-usermodel-attribute-mapper	\N	f3ce69fa-aeb3-4cb8-9759-67a3372f0c63
cd00e0c1-8fc0-4af3-8de8-dc66d3e5aa35	nickname	openid-connect	oidc-usermodel-attribute-mapper	\N	f3ce69fa-aeb3-4cb8-9759-67a3372f0c63
313daaac-48d8-4e6b-95ef-64f6bca8a4db	username	openid-connect	oidc-usermodel-property-mapper	\N	f3ce69fa-aeb3-4cb8-9759-67a3372f0c63
f235834b-01ee-4139-947c-d77e1c14c575	profile	openid-connect	oidc-usermodel-attribute-mapper	\N	f3ce69fa-aeb3-4cb8-9759-67a3372f0c63
1d46183d-6f3f-4060-94b9-498662258344	picture	openid-connect	oidc-usermodel-attribute-mapper	\N	f3ce69fa-aeb3-4cb8-9759-67a3372f0c63
23c63a52-c640-4491-8740-0ef8674683b9	website	openid-connect	oidc-usermodel-attribute-mapper	\N	f3ce69fa-aeb3-4cb8-9759-67a3372f0c63
530db0f5-ad77-4577-a96a-a4a2ac91aff0	gender	openid-connect	oidc-usermodel-attribute-mapper	\N	f3ce69fa-aeb3-4cb8-9759-67a3372f0c63
81722ac8-ea0e-4166-84e0-a6cb930d1d23	birthdate	openid-connect	oidc-usermodel-attribute-mapper	\N	f3ce69fa-aeb3-4cb8-9759-67a3372f0c63
bab76bd9-0353-46c9-8e8b-37d7e95bfe46	zoneinfo	openid-connect	oidc-usermodel-attribute-mapper	\N	f3ce69fa-aeb3-4cb8-9759-67a3372f0c63
bcf27335-b103-4709-84c9-2c09045bb927	locale	openid-connect	oidc-usermodel-attribute-mapper	\N	f3ce69fa-aeb3-4cb8-9759-67a3372f0c63
3aa1fa48-c9b3-4b63-bc68-1b8966d927fb	updated at	openid-connect	oidc-usermodel-attribute-mapper	\N	f3ce69fa-aeb3-4cb8-9759-67a3372f0c63
51373131-48e4-4400-8f38-8689844ee616	email	openid-connect	oidc-usermodel-property-mapper	\N	c4b6a356-2906-4a17-9546-507476cf81d5
790113e5-a854-44f0-afcc-f0cf720b466c	email verified	openid-connect	oidc-usermodel-property-mapper	\N	c4b6a356-2906-4a17-9546-507476cf81d5
47cb50eb-ac0e-4041-91b1-36b65ac42ba4	address	openid-connect	oidc-address-mapper	\N	25958312-9f42-4f0d-9b4f-e5a68e4f830e
3e4e4016-55a0-4182-838f-7c9f26153b55	phone number	openid-connect	oidc-usermodel-attribute-mapper	\N	538115b2-78c6-4efb-afe5-ed60f57e671c
f5cf26c2-896d-42a2-9e6b-8fe89bbaf09a	phone number verified	openid-connect	oidc-usermodel-attribute-mapper	\N	538115b2-78c6-4efb-afe5-ed60f57e671c
b8a15fed-45ef-48c7-a497-45e2432e7c12	realm roles	openid-connect	oidc-usermodel-realm-role-mapper	\N	d9ff9f93-fc8c-4b50-a10a-a9e4739d96f3
38319ec6-0262-41ad-ac21-3a49513ad2cd	client roles	openid-connect	oidc-usermodel-client-role-mapper	\N	d9ff9f93-fc8c-4b50-a10a-a9e4739d96f3
03dc5ab7-f969-4ccd-b886-ec0ef4ff3ca4	audience resolve	openid-connect	oidc-audience-resolve-mapper	\N	d9ff9f93-fc8c-4b50-a10a-a9e4739d96f3
d48c7d07-32e8-4631-a624-60eb70c4a67c	allowed web origins	openid-connect	oidc-allowed-origins-mapper	\N	ae1e5ac4-048e-4636-a609-e1d85fa04219
2d1455b7-fd92-40a2-bd92-b36afc80ff88	upn	openid-connect	oidc-usermodel-property-mapper	\N	97ebab9a-b654-46f7-ba13-258a628b40b0
3cb00b14-c28a-4dc9-8500-212bf3119bcc	groups	openid-connect	oidc-usermodel-realm-role-mapper	\N	97ebab9a-b654-46f7-ba13-258a628b40b0
853d2108-fb7a-4a6e-a945-a159c936274b	acr loa level	openid-connect	oidc-acr-mapper	\N	599c454c-a0c0-41a2-b620-3dc847990c5c
aa4991ec-793d-49ed-b8fd-1adf54ee289a	locale	openid-connect	oidc-usermodel-attribute-mapper	eb91b398-177d-447e-b2ee-603f43be4aa3	\N
2d78fd4c-cd85-4602-a47e-43b4284a034a	Client ID	openid-connect	oidc-usersessionmodel-note-mapper	13439173-4f6a-4bb7-bdd7-30e70cce2f65	\N
a8e229ef-23df-499a-8d9a-09ff3fa1264f	Client Host	openid-connect	oidc-usersessionmodel-note-mapper	13439173-4f6a-4bb7-bdd7-30e70cce2f65	\N
039fa6c5-704f-4075-8793-b1a7bf702926	Client IP Address	openid-connect	oidc-usersessionmodel-note-mapper	13439173-4f6a-4bb7-bdd7-30e70cce2f65	\N
\.


--
-- Data for Name: protocol_mapper_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.protocol_mapper_config (protocol_mapper_id, value, name) FROM stdin;
e321f22f-2460-4ca8-8ebb-f91ce87f6694	true	userinfo.token.claim
e321f22f-2460-4ca8-8ebb-f91ce87f6694	locale	user.attribute
e321f22f-2460-4ca8-8ebb-f91ce87f6694	true	id.token.claim
e321f22f-2460-4ca8-8ebb-f91ce87f6694	true	access.token.claim
e321f22f-2460-4ca8-8ebb-f91ce87f6694	locale	claim.name
e321f22f-2460-4ca8-8ebb-f91ce87f6694	String	jsonType.label
2dfddfb9-4e19-4016-95fb-093c8e023d03	false	single
2dfddfb9-4e19-4016-95fb-093c8e023d03	Basic	attribute.nameformat
2dfddfb9-4e19-4016-95fb-093c8e023d03	Role	attribute.name
11789775-604f-43f2-bf15-5e9ecc6d8b24	true	userinfo.token.claim
11789775-604f-43f2-bf15-5e9ecc6d8b24	gender	user.attribute
11789775-604f-43f2-bf15-5e9ecc6d8b24	true	id.token.claim
11789775-604f-43f2-bf15-5e9ecc6d8b24	true	access.token.claim
11789775-604f-43f2-bf15-5e9ecc6d8b24	gender	claim.name
11789775-604f-43f2-bf15-5e9ecc6d8b24	String	jsonType.label
3e20b7df-355d-4557-9642-31185051258d	true	userinfo.token.claim
3e20b7df-355d-4557-9642-31185051258d	picture	user.attribute
3e20b7df-355d-4557-9642-31185051258d	true	id.token.claim
3e20b7df-355d-4557-9642-31185051258d	true	access.token.claim
3e20b7df-355d-4557-9642-31185051258d	picture	claim.name
3e20b7df-355d-4557-9642-31185051258d	String	jsonType.label
583423b5-f768-4863-829c-1e43c6796301	true	userinfo.token.claim
583423b5-f768-4863-829c-1e43c6796301	nickname	user.attribute
583423b5-f768-4863-829c-1e43c6796301	true	id.token.claim
583423b5-f768-4863-829c-1e43c6796301	true	access.token.claim
583423b5-f768-4863-829c-1e43c6796301	nickname	claim.name
583423b5-f768-4863-829c-1e43c6796301	String	jsonType.label
5e6f3b54-c907-457b-931e-677f560d6ca5	true	userinfo.token.claim
5e6f3b54-c907-457b-931e-677f560d6ca5	locale	user.attribute
5e6f3b54-c907-457b-931e-677f560d6ca5	true	id.token.claim
5e6f3b54-c907-457b-931e-677f560d6ca5	true	access.token.claim
5e6f3b54-c907-457b-931e-677f560d6ca5	locale	claim.name
5e6f3b54-c907-457b-931e-677f560d6ca5	String	jsonType.label
6a508c5b-682b-4d24-8108-fd1b3ad47dc9	true	userinfo.token.claim
6a508c5b-682b-4d24-8108-fd1b3ad47dc9	middleName	user.attribute
6a508c5b-682b-4d24-8108-fd1b3ad47dc9	true	id.token.claim
6a508c5b-682b-4d24-8108-fd1b3ad47dc9	true	access.token.claim
6a508c5b-682b-4d24-8108-fd1b3ad47dc9	middle_name	claim.name
6a508c5b-682b-4d24-8108-fd1b3ad47dc9	String	jsonType.label
86f17df8-9689-4867-ba0a-2d824470f017	true	userinfo.token.claim
86f17df8-9689-4867-ba0a-2d824470f017	firstName	user.attribute
86f17df8-9689-4867-ba0a-2d824470f017	true	id.token.claim
86f17df8-9689-4867-ba0a-2d824470f017	true	access.token.claim
86f17df8-9689-4867-ba0a-2d824470f017	given_name	claim.name
86f17df8-9689-4867-ba0a-2d824470f017	String	jsonType.label
8d520a93-9208-49b6-a355-e99e3875b787	true	userinfo.token.claim
8d520a93-9208-49b6-a355-e99e3875b787	website	user.attribute
8d520a93-9208-49b6-a355-e99e3875b787	true	id.token.claim
8d520a93-9208-49b6-a355-e99e3875b787	true	access.token.claim
8d520a93-9208-49b6-a355-e99e3875b787	website	claim.name
8d520a93-9208-49b6-a355-e99e3875b787	String	jsonType.label
b30d6f94-3559-4832-97c7-39e628776dc7	true	userinfo.token.claim
b30d6f94-3559-4832-97c7-39e628776dc7	profile	user.attribute
b30d6f94-3559-4832-97c7-39e628776dc7	true	id.token.claim
b30d6f94-3559-4832-97c7-39e628776dc7	true	access.token.claim
b30d6f94-3559-4832-97c7-39e628776dc7	profile	claim.name
b30d6f94-3559-4832-97c7-39e628776dc7	String	jsonType.label
b7085169-8c3d-42c1-b69c-0af6715a9a3b	true	userinfo.token.claim
b7085169-8c3d-42c1-b69c-0af6715a9a3b	lastName	user.attribute
b7085169-8c3d-42c1-b69c-0af6715a9a3b	true	id.token.claim
b7085169-8c3d-42c1-b69c-0af6715a9a3b	true	access.token.claim
b7085169-8c3d-42c1-b69c-0af6715a9a3b	family_name	claim.name
b7085169-8c3d-42c1-b69c-0af6715a9a3b	String	jsonType.label
b77349a4-8d65-47b9-bcac-abd9ee5c1de8	true	userinfo.token.claim
b77349a4-8d65-47b9-bcac-abd9ee5c1de8	updatedAt	user.attribute
b77349a4-8d65-47b9-bcac-abd9ee5c1de8	true	id.token.claim
b77349a4-8d65-47b9-bcac-abd9ee5c1de8	true	access.token.claim
b77349a4-8d65-47b9-bcac-abd9ee5c1de8	updated_at	claim.name
b77349a4-8d65-47b9-bcac-abd9ee5c1de8	long	jsonType.label
c5adc642-6579-4b87-acc3-e463dfa8c566	true	userinfo.token.claim
c5adc642-6579-4b87-acc3-e463dfa8c566	true	id.token.claim
c5adc642-6579-4b87-acc3-e463dfa8c566	true	access.token.claim
e9890472-5173-423b-8dd7-5c3a9bed71b4	true	userinfo.token.claim
e9890472-5173-423b-8dd7-5c3a9bed71b4	zoneinfo	user.attribute
e9890472-5173-423b-8dd7-5c3a9bed71b4	true	id.token.claim
e9890472-5173-423b-8dd7-5c3a9bed71b4	true	access.token.claim
e9890472-5173-423b-8dd7-5c3a9bed71b4	zoneinfo	claim.name
e9890472-5173-423b-8dd7-5c3a9bed71b4	String	jsonType.label
ee3d676d-601f-4676-83a2-06848af2629c	true	userinfo.token.claim
ee3d676d-601f-4676-83a2-06848af2629c	birthdate	user.attribute
ee3d676d-601f-4676-83a2-06848af2629c	true	id.token.claim
ee3d676d-601f-4676-83a2-06848af2629c	true	access.token.claim
ee3d676d-601f-4676-83a2-06848af2629c	birthdate	claim.name
ee3d676d-601f-4676-83a2-06848af2629c	String	jsonType.label
f14ff452-e3c6-4b38-9acb-7cfecdea802b	true	userinfo.token.claim
f14ff452-e3c6-4b38-9acb-7cfecdea802b	username	user.attribute
f14ff452-e3c6-4b38-9acb-7cfecdea802b	true	id.token.claim
f14ff452-e3c6-4b38-9acb-7cfecdea802b	true	access.token.claim
f14ff452-e3c6-4b38-9acb-7cfecdea802b	preferred_username	claim.name
f14ff452-e3c6-4b38-9acb-7cfecdea802b	String	jsonType.label
d6a24cb6-2682-4e15-b97d-7880412353a4	true	userinfo.token.claim
d6a24cb6-2682-4e15-b97d-7880412353a4	email	user.attribute
d6a24cb6-2682-4e15-b97d-7880412353a4	true	id.token.claim
d6a24cb6-2682-4e15-b97d-7880412353a4	true	access.token.claim
d6a24cb6-2682-4e15-b97d-7880412353a4	email	claim.name
d6a24cb6-2682-4e15-b97d-7880412353a4	String	jsonType.label
ef2790b4-9031-461f-ac6e-c708269559d2	true	userinfo.token.claim
ef2790b4-9031-461f-ac6e-c708269559d2	emailVerified	user.attribute
ef2790b4-9031-461f-ac6e-c708269559d2	true	id.token.claim
ef2790b4-9031-461f-ac6e-c708269559d2	true	access.token.claim
ef2790b4-9031-461f-ac6e-c708269559d2	email_verified	claim.name
ef2790b4-9031-461f-ac6e-c708269559d2	boolean	jsonType.label
330d88b4-ba25-4892-972b-c6c0647233a2	formatted	user.attribute.formatted
330d88b4-ba25-4892-972b-c6c0647233a2	country	user.attribute.country
330d88b4-ba25-4892-972b-c6c0647233a2	postal_code	user.attribute.postal_code
330d88b4-ba25-4892-972b-c6c0647233a2	true	userinfo.token.claim
330d88b4-ba25-4892-972b-c6c0647233a2	street	user.attribute.street
330d88b4-ba25-4892-972b-c6c0647233a2	true	id.token.claim
330d88b4-ba25-4892-972b-c6c0647233a2	region	user.attribute.region
330d88b4-ba25-4892-972b-c6c0647233a2	true	access.token.claim
330d88b4-ba25-4892-972b-c6c0647233a2	locality	user.attribute.locality
1fd3f020-ebed-4518-8e1f-756c6860858e	true	userinfo.token.claim
1fd3f020-ebed-4518-8e1f-756c6860858e	phoneNumber	user.attribute
1fd3f020-ebed-4518-8e1f-756c6860858e	true	id.token.claim
1fd3f020-ebed-4518-8e1f-756c6860858e	true	access.token.claim
1fd3f020-ebed-4518-8e1f-756c6860858e	phone_number	claim.name
1fd3f020-ebed-4518-8e1f-756c6860858e	String	jsonType.label
c748a2df-7d60-44fe-b814-45a6b76b42b0	true	userinfo.token.claim
c748a2df-7d60-44fe-b814-45a6b76b42b0	phoneNumberVerified	user.attribute
c748a2df-7d60-44fe-b814-45a6b76b42b0	true	id.token.claim
c748a2df-7d60-44fe-b814-45a6b76b42b0	true	access.token.claim
c748a2df-7d60-44fe-b814-45a6b76b42b0	phone_number_verified	claim.name
c748a2df-7d60-44fe-b814-45a6b76b42b0	boolean	jsonType.label
38c6229e-9d7e-44c3-bf35-60981eea62ab	true	multivalued
38c6229e-9d7e-44c3-bf35-60981eea62ab	foo	user.attribute
38c6229e-9d7e-44c3-bf35-60981eea62ab	true	access.token.claim
38c6229e-9d7e-44c3-bf35-60981eea62ab	realm_access.roles	claim.name
38c6229e-9d7e-44c3-bf35-60981eea62ab	String	jsonType.label
7e735409-9863-4e10-8202-03879b88493e	true	multivalued
7e735409-9863-4e10-8202-03879b88493e	foo	user.attribute
7e735409-9863-4e10-8202-03879b88493e	true	access.token.claim
7e735409-9863-4e10-8202-03879b88493e	resource_access.${client_id}.roles	claim.name
7e735409-9863-4e10-8202-03879b88493e	String	jsonType.label
1f506afb-acb5-4dcc-b1b5-bbb906911cbc	true	multivalued
1f506afb-acb5-4dcc-b1b5-bbb906911cbc	foo	user.attribute
1f506afb-acb5-4dcc-b1b5-bbb906911cbc	true	id.token.claim
1f506afb-acb5-4dcc-b1b5-bbb906911cbc	true	access.token.claim
1f506afb-acb5-4dcc-b1b5-bbb906911cbc	groups	claim.name
1f506afb-acb5-4dcc-b1b5-bbb906911cbc	String	jsonType.label
33025727-f9df-463b-bb70-8e5526b27f21	true	userinfo.token.claim
33025727-f9df-463b-bb70-8e5526b27f21	username	user.attribute
33025727-f9df-463b-bb70-8e5526b27f21	true	id.token.claim
33025727-f9df-463b-bb70-8e5526b27f21	true	access.token.claim
33025727-f9df-463b-bb70-8e5526b27f21	upn	claim.name
33025727-f9df-463b-bb70-8e5526b27f21	String	jsonType.label
0605dc19-1afd-4f3a-8565-25b3289d0c20	true	id.token.claim
0605dc19-1afd-4f3a-8565-25b3289d0c20	true	access.token.claim
d155fcee-b180-46ac-bd2c-30f80b57e129	false	single
d155fcee-b180-46ac-bd2c-30f80b57e129	Basic	attribute.nameformat
d155fcee-b180-46ac-bd2c-30f80b57e129	Role	attribute.name
1b0bfc64-0483-458d-85bc-810504d9e82d	true	userinfo.token.claim
1b0bfc64-0483-458d-85bc-810504d9e82d	middleName	user.attribute
1b0bfc64-0483-458d-85bc-810504d9e82d	true	id.token.claim
1b0bfc64-0483-458d-85bc-810504d9e82d	true	access.token.claim
1b0bfc64-0483-458d-85bc-810504d9e82d	middle_name	claim.name
1b0bfc64-0483-458d-85bc-810504d9e82d	String	jsonType.label
1d46183d-6f3f-4060-94b9-498662258344	true	userinfo.token.claim
1d46183d-6f3f-4060-94b9-498662258344	picture	user.attribute
1d46183d-6f3f-4060-94b9-498662258344	true	id.token.claim
1d46183d-6f3f-4060-94b9-498662258344	true	access.token.claim
1d46183d-6f3f-4060-94b9-498662258344	picture	claim.name
1d46183d-6f3f-4060-94b9-498662258344	String	jsonType.label
23c63a52-c640-4491-8740-0ef8674683b9	true	userinfo.token.claim
23c63a52-c640-4491-8740-0ef8674683b9	website	user.attribute
23c63a52-c640-4491-8740-0ef8674683b9	true	id.token.claim
23c63a52-c640-4491-8740-0ef8674683b9	true	access.token.claim
23c63a52-c640-4491-8740-0ef8674683b9	website	claim.name
23c63a52-c640-4491-8740-0ef8674683b9	String	jsonType.label
313daaac-48d8-4e6b-95ef-64f6bca8a4db	true	userinfo.token.claim
313daaac-48d8-4e6b-95ef-64f6bca8a4db	username	user.attribute
313daaac-48d8-4e6b-95ef-64f6bca8a4db	true	id.token.claim
313daaac-48d8-4e6b-95ef-64f6bca8a4db	true	access.token.claim
313daaac-48d8-4e6b-95ef-64f6bca8a4db	preferred_username	claim.name
313daaac-48d8-4e6b-95ef-64f6bca8a4db	String	jsonType.label
3651db32-7768-48ea-bd5e-d4dc149aba76	true	userinfo.token.claim
3651db32-7768-48ea-bd5e-d4dc149aba76	lastName	user.attribute
3651db32-7768-48ea-bd5e-d4dc149aba76	true	id.token.claim
3651db32-7768-48ea-bd5e-d4dc149aba76	true	access.token.claim
3651db32-7768-48ea-bd5e-d4dc149aba76	family_name	claim.name
3651db32-7768-48ea-bd5e-d4dc149aba76	String	jsonType.label
3aa1fa48-c9b3-4b63-bc68-1b8966d927fb	true	userinfo.token.claim
3aa1fa48-c9b3-4b63-bc68-1b8966d927fb	updatedAt	user.attribute
3aa1fa48-c9b3-4b63-bc68-1b8966d927fb	true	id.token.claim
3aa1fa48-c9b3-4b63-bc68-1b8966d927fb	true	access.token.claim
3aa1fa48-c9b3-4b63-bc68-1b8966d927fb	updated_at	claim.name
3aa1fa48-c9b3-4b63-bc68-1b8966d927fb	long	jsonType.label
530db0f5-ad77-4577-a96a-a4a2ac91aff0	true	userinfo.token.claim
530db0f5-ad77-4577-a96a-a4a2ac91aff0	gender	user.attribute
530db0f5-ad77-4577-a96a-a4a2ac91aff0	true	id.token.claim
530db0f5-ad77-4577-a96a-a4a2ac91aff0	true	access.token.claim
530db0f5-ad77-4577-a96a-a4a2ac91aff0	gender	claim.name
530db0f5-ad77-4577-a96a-a4a2ac91aff0	String	jsonType.label
81722ac8-ea0e-4166-84e0-a6cb930d1d23	true	userinfo.token.claim
81722ac8-ea0e-4166-84e0-a6cb930d1d23	birthdate	user.attribute
81722ac8-ea0e-4166-84e0-a6cb930d1d23	true	id.token.claim
81722ac8-ea0e-4166-84e0-a6cb930d1d23	true	access.token.claim
81722ac8-ea0e-4166-84e0-a6cb930d1d23	birthdate	claim.name
81722ac8-ea0e-4166-84e0-a6cb930d1d23	String	jsonType.label
82a2e459-977c-45b2-b56f-0f545d3bf710	true	userinfo.token.claim
82a2e459-977c-45b2-b56f-0f545d3bf710	true	id.token.claim
82a2e459-977c-45b2-b56f-0f545d3bf710	true	access.token.claim
a916165d-2811-41f6-bef5-cc4f10d8b9dd	true	userinfo.token.claim
a916165d-2811-41f6-bef5-cc4f10d8b9dd	firstName	user.attribute
a916165d-2811-41f6-bef5-cc4f10d8b9dd	true	id.token.claim
a916165d-2811-41f6-bef5-cc4f10d8b9dd	true	access.token.claim
a916165d-2811-41f6-bef5-cc4f10d8b9dd	given_name	claim.name
a916165d-2811-41f6-bef5-cc4f10d8b9dd	String	jsonType.label
bab76bd9-0353-46c9-8e8b-37d7e95bfe46	true	userinfo.token.claim
bab76bd9-0353-46c9-8e8b-37d7e95bfe46	zoneinfo	user.attribute
bab76bd9-0353-46c9-8e8b-37d7e95bfe46	true	id.token.claim
bab76bd9-0353-46c9-8e8b-37d7e95bfe46	true	access.token.claim
bab76bd9-0353-46c9-8e8b-37d7e95bfe46	zoneinfo	claim.name
bab76bd9-0353-46c9-8e8b-37d7e95bfe46	String	jsonType.label
bcf27335-b103-4709-84c9-2c09045bb927	true	userinfo.token.claim
bcf27335-b103-4709-84c9-2c09045bb927	locale	user.attribute
bcf27335-b103-4709-84c9-2c09045bb927	true	id.token.claim
bcf27335-b103-4709-84c9-2c09045bb927	true	access.token.claim
bcf27335-b103-4709-84c9-2c09045bb927	locale	claim.name
bcf27335-b103-4709-84c9-2c09045bb927	String	jsonType.label
cd00e0c1-8fc0-4af3-8de8-dc66d3e5aa35	true	userinfo.token.claim
cd00e0c1-8fc0-4af3-8de8-dc66d3e5aa35	nickname	user.attribute
cd00e0c1-8fc0-4af3-8de8-dc66d3e5aa35	true	id.token.claim
cd00e0c1-8fc0-4af3-8de8-dc66d3e5aa35	true	access.token.claim
cd00e0c1-8fc0-4af3-8de8-dc66d3e5aa35	nickname	claim.name
cd00e0c1-8fc0-4af3-8de8-dc66d3e5aa35	String	jsonType.label
f235834b-01ee-4139-947c-d77e1c14c575	true	userinfo.token.claim
f235834b-01ee-4139-947c-d77e1c14c575	profile	user.attribute
f235834b-01ee-4139-947c-d77e1c14c575	true	id.token.claim
f235834b-01ee-4139-947c-d77e1c14c575	true	access.token.claim
f235834b-01ee-4139-947c-d77e1c14c575	profile	claim.name
f235834b-01ee-4139-947c-d77e1c14c575	String	jsonType.label
51373131-48e4-4400-8f38-8689844ee616	true	userinfo.token.claim
51373131-48e4-4400-8f38-8689844ee616	email	user.attribute
51373131-48e4-4400-8f38-8689844ee616	true	id.token.claim
51373131-48e4-4400-8f38-8689844ee616	true	access.token.claim
51373131-48e4-4400-8f38-8689844ee616	email	claim.name
51373131-48e4-4400-8f38-8689844ee616	String	jsonType.label
790113e5-a854-44f0-afcc-f0cf720b466c	true	userinfo.token.claim
790113e5-a854-44f0-afcc-f0cf720b466c	emailVerified	user.attribute
790113e5-a854-44f0-afcc-f0cf720b466c	true	id.token.claim
790113e5-a854-44f0-afcc-f0cf720b466c	true	access.token.claim
790113e5-a854-44f0-afcc-f0cf720b466c	email_verified	claim.name
790113e5-a854-44f0-afcc-f0cf720b466c	boolean	jsonType.label
47cb50eb-ac0e-4041-91b1-36b65ac42ba4	formatted	user.attribute.formatted
47cb50eb-ac0e-4041-91b1-36b65ac42ba4	country	user.attribute.country
47cb50eb-ac0e-4041-91b1-36b65ac42ba4	postal_code	user.attribute.postal_code
47cb50eb-ac0e-4041-91b1-36b65ac42ba4	true	userinfo.token.claim
47cb50eb-ac0e-4041-91b1-36b65ac42ba4	street	user.attribute.street
47cb50eb-ac0e-4041-91b1-36b65ac42ba4	true	id.token.claim
47cb50eb-ac0e-4041-91b1-36b65ac42ba4	region	user.attribute.region
47cb50eb-ac0e-4041-91b1-36b65ac42ba4	true	access.token.claim
47cb50eb-ac0e-4041-91b1-36b65ac42ba4	locality	user.attribute.locality
3e4e4016-55a0-4182-838f-7c9f26153b55	true	userinfo.token.claim
3e4e4016-55a0-4182-838f-7c9f26153b55	phoneNumber	user.attribute
3e4e4016-55a0-4182-838f-7c9f26153b55	true	id.token.claim
3e4e4016-55a0-4182-838f-7c9f26153b55	true	access.token.claim
3e4e4016-55a0-4182-838f-7c9f26153b55	phone_number	claim.name
3e4e4016-55a0-4182-838f-7c9f26153b55	String	jsonType.label
f5cf26c2-896d-42a2-9e6b-8fe89bbaf09a	true	userinfo.token.claim
f5cf26c2-896d-42a2-9e6b-8fe89bbaf09a	phoneNumberVerified	user.attribute
f5cf26c2-896d-42a2-9e6b-8fe89bbaf09a	true	id.token.claim
f5cf26c2-896d-42a2-9e6b-8fe89bbaf09a	true	access.token.claim
f5cf26c2-896d-42a2-9e6b-8fe89bbaf09a	phone_number_verified	claim.name
f5cf26c2-896d-42a2-9e6b-8fe89bbaf09a	boolean	jsonType.label
38319ec6-0262-41ad-ac21-3a49513ad2cd	true	multivalued
38319ec6-0262-41ad-ac21-3a49513ad2cd	foo	user.attribute
38319ec6-0262-41ad-ac21-3a49513ad2cd	true	access.token.claim
38319ec6-0262-41ad-ac21-3a49513ad2cd	resource_access.${client_id}.roles	claim.name
38319ec6-0262-41ad-ac21-3a49513ad2cd	String	jsonType.label
b8a15fed-45ef-48c7-a497-45e2432e7c12	true	multivalued
b8a15fed-45ef-48c7-a497-45e2432e7c12	foo	user.attribute
b8a15fed-45ef-48c7-a497-45e2432e7c12	true	access.token.claim
b8a15fed-45ef-48c7-a497-45e2432e7c12	realm_access.roles	claim.name
b8a15fed-45ef-48c7-a497-45e2432e7c12	String	jsonType.label
2d1455b7-fd92-40a2-bd92-b36afc80ff88	true	userinfo.token.claim
2d1455b7-fd92-40a2-bd92-b36afc80ff88	username	user.attribute
2d1455b7-fd92-40a2-bd92-b36afc80ff88	true	id.token.claim
2d1455b7-fd92-40a2-bd92-b36afc80ff88	true	access.token.claim
2d1455b7-fd92-40a2-bd92-b36afc80ff88	upn	claim.name
2d1455b7-fd92-40a2-bd92-b36afc80ff88	String	jsonType.label
3cb00b14-c28a-4dc9-8500-212bf3119bcc	true	multivalued
3cb00b14-c28a-4dc9-8500-212bf3119bcc	foo	user.attribute
3cb00b14-c28a-4dc9-8500-212bf3119bcc	true	id.token.claim
3cb00b14-c28a-4dc9-8500-212bf3119bcc	true	access.token.claim
3cb00b14-c28a-4dc9-8500-212bf3119bcc	groups	claim.name
3cb00b14-c28a-4dc9-8500-212bf3119bcc	String	jsonType.label
853d2108-fb7a-4a6e-a945-a159c936274b	true	id.token.claim
853d2108-fb7a-4a6e-a945-a159c936274b	true	access.token.claim
aa4991ec-793d-49ed-b8fd-1adf54ee289a	true	userinfo.token.claim
aa4991ec-793d-49ed-b8fd-1adf54ee289a	locale	user.attribute
aa4991ec-793d-49ed-b8fd-1adf54ee289a	true	id.token.claim
aa4991ec-793d-49ed-b8fd-1adf54ee289a	true	access.token.claim
aa4991ec-793d-49ed-b8fd-1adf54ee289a	locale	claim.name
aa4991ec-793d-49ed-b8fd-1adf54ee289a	String	jsonType.label
039fa6c5-704f-4075-8793-b1a7bf702926	clientAddress	user.session.note
039fa6c5-704f-4075-8793-b1a7bf702926	true	id.token.claim
039fa6c5-704f-4075-8793-b1a7bf702926	true	access.token.claim
039fa6c5-704f-4075-8793-b1a7bf702926	clientAddress	claim.name
039fa6c5-704f-4075-8793-b1a7bf702926	String	jsonType.label
2d78fd4c-cd85-4602-a47e-43b4284a034a	clientId	user.session.note
2d78fd4c-cd85-4602-a47e-43b4284a034a	true	id.token.claim
2d78fd4c-cd85-4602-a47e-43b4284a034a	true	access.token.claim
2d78fd4c-cd85-4602-a47e-43b4284a034a	clientId	claim.name
2d78fd4c-cd85-4602-a47e-43b4284a034a	String	jsonType.label
a8e229ef-23df-499a-8d9a-09ff3fa1264f	clientHost	user.session.note
a8e229ef-23df-499a-8d9a-09ff3fa1264f	true	id.token.claim
a8e229ef-23df-499a-8d9a-09ff3fa1264f	true	access.token.claim
a8e229ef-23df-499a-8d9a-09ff3fa1264f	clientHost	claim.name
a8e229ef-23df-499a-8d9a-09ff3fa1264f	String	jsonType.label
\.


--
-- Data for Name: realm; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.realm (id, access_code_lifespan, user_action_lifespan, access_token_lifespan, account_theme, admin_theme, email_theme, enabled, events_enabled, events_expiration, login_theme, name, not_before, password_policy, registration_allowed, remember_me, reset_password_allowed, social, ssl_required, sso_idle_timeout, sso_max_lifespan, update_profile_on_soc_login, verify_email, master_admin_client, login_lifespan, internationalization_enabled, default_locale, reg_email_as_username, admin_events_enabled, admin_events_details_enabled, edit_username_allowed, otp_policy_counter, otp_policy_window, otp_policy_period, otp_policy_digits, otp_policy_alg, otp_policy_type, browser_flow, registration_flow, direct_grant_flow, reset_credentials_flow, client_auth_flow, offline_session_idle_timeout, revoke_refresh_token, access_token_life_implicit, login_with_email_allowed, duplicate_emails_allowed, docker_auth_flow, refresh_token_max_reuse, allow_user_managed_access, sso_max_lifespan_remember_me, sso_idle_timeout_remember_me, default_role) FROM stdin;
fd4a6218-c54d-4a98-bddb-08dba17ec4ef	60	300	60	\N	\N	\N	t	f	0	\N	master	0	\N	f	f	f	f	EXTERNAL	1800	36000	f	f	20a47e58-c362-40ef-ba05-16037dbaf30e	1800	f	\N	f	f	f	f	0	1	30	6	HmacSHA1	totp	57849afe-4024-421c-a37f-51ef41220726	8e2b0be5-3ce2-4009-be38-558c4d9e700b	14b83cb2-f3dd-49f9-a8ab-59d9a1da0311	dba02a39-f951-4856-9023-e468e3afd31f	77058134-fd7b-4e6a-9a1a-ca15f95053db	2592000	f	900	t	f	cdcaa89c-b836-4b9d-8d01-ead9b75dea72	0	f	0	0	0bede6dd-e745-421f-a443-e2363d61f5e2
a5069552-e930-4472-8a7f-facf76e3e7f5	60	300	300	\N	\N	\N	t	f	0	\N	benchmark	0	\N	f	f	f	f	EXTERNAL	1800	36000	f	f	9c38e015-a478-4c19-ab1a-0818711f31c4	1800	f	\N	f	f	f	f	0	1	30	6	HmacSHA1	totp	4535e69b-2039-40ea-b561-33a8c814ff87	0e104e0f-5ceb-4daa-96d1-5cb875b8e542	bd5f140a-ceac-41d7-b50c-8f47c3610bb7	d27f4f65-302f-44d4-b875-dfd97f4068d4	4ab383a9-5354-4e93-8050-acb9f3e36fa0	2592000	f	900	t	f	a237a83d-5155-4fb0-8d3b-4de114f5fa45	0	f	0	0	acff3968-4e16-483c-9471-b13b5ff72b18
\.


--
-- Data for Name: realm_attribute; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.realm_attribute (name, realm_id, value) FROM stdin;
_browser_header.contentSecurityPolicyReportOnly	fd4a6218-c54d-4a98-bddb-08dba17ec4ef	
_browser_header.xContentTypeOptions	fd4a6218-c54d-4a98-bddb-08dba17ec4ef	nosniff
_browser_header.xRobotsTag	fd4a6218-c54d-4a98-bddb-08dba17ec4ef	none
_browser_header.xFrameOptions	fd4a6218-c54d-4a98-bddb-08dba17ec4ef	SAMEORIGIN
_browser_header.contentSecurityPolicy	fd4a6218-c54d-4a98-bddb-08dba17ec4ef	frame-src 'self'; frame-ancestors 'self'; object-src 'none';
_browser_header.xXSSProtection	fd4a6218-c54d-4a98-bddb-08dba17ec4ef	1; mode=block
_browser_header.strictTransportSecurity	fd4a6218-c54d-4a98-bddb-08dba17ec4ef	max-age=31536000; includeSubDomains
bruteForceProtected	fd4a6218-c54d-4a98-bddb-08dba17ec4ef	false
permanentLockout	fd4a6218-c54d-4a98-bddb-08dba17ec4ef	false
maxFailureWaitSeconds	fd4a6218-c54d-4a98-bddb-08dba17ec4ef	900
minimumQuickLoginWaitSeconds	fd4a6218-c54d-4a98-bddb-08dba17ec4ef	60
waitIncrementSeconds	fd4a6218-c54d-4a98-bddb-08dba17ec4ef	60
quickLoginCheckMilliSeconds	fd4a6218-c54d-4a98-bddb-08dba17ec4ef	1000
maxDeltaTimeSeconds	fd4a6218-c54d-4a98-bddb-08dba17ec4ef	43200
failureFactor	fd4a6218-c54d-4a98-bddb-08dba17ec4ef	30
displayName	fd4a6218-c54d-4a98-bddb-08dba17ec4ef	Keycloak
displayNameHtml	fd4a6218-c54d-4a98-bddb-08dba17ec4ef	<div class="kc-logo-text"><span>Keycloak</span></div>
defaultSignatureAlgorithm	fd4a6218-c54d-4a98-bddb-08dba17ec4ef	RS256
offlineSessionMaxLifespanEnabled	fd4a6218-c54d-4a98-bddb-08dba17ec4ef	false
offlineSessionMaxLifespan	fd4a6218-c54d-4a98-bddb-08dba17ec4ef	5184000
_browser_header.contentSecurityPolicyReportOnly	a5069552-e930-4472-8a7f-facf76e3e7f5	
_browser_header.xContentTypeOptions	a5069552-e930-4472-8a7f-facf76e3e7f5	nosniff
_browser_header.xRobotsTag	a5069552-e930-4472-8a7f-facf76e3e7f5	none
_browser_header.xFrameOptions	a5069552-e930-4472-8a7f-facf76e3e7f5	SAMEORIGIN
_browser_header.contentSecurityPolicy	a5069552-e930-4472-8a7f-facf76e3e7f5	frame-src 'self'; frame-ancestors 'self'; object-src 'none';
_browser_header.xXSSProtection	a5069552-e930-4472-8a7f-facf76e3e7f5	1; mode=block
_browser_header.strictTransportSecurity	a5069552-e930-4472-8a7f-facf76e3e7f5	max-age=31536000; includeSubDomains
bruteForceProtected	a5069552-e930-4472-8a7f-facf76e3e7f5	false
permanentLockout	a5069552-e930-4472-8a7f-facf76e3e7f5	false
maxFailureWaitSeconds	a5069552-e930-4472-8a7f-facf76e3e7f5	900
minimumQuickLoginWaitSeconds	a5069552-e930-4472-8a7f-facf76e3e7f5	60
waitIncrementSeconds	a5069552-e930-4472-8a7f-facf76e3e7f5	60
quickLoginCheckMilliSeconds	a5069552-e930-4472-8a7f-facf76e3e7f5	1000
maxDeltaTimeSeconds	a5069552-e930-4472-8a7f-facf76e3e7f5	43200
failureFactor	a5069552-e930-4472-8a7f-facf76e3e7f5	30
defaultSignatureAlgorithm	a5069552-e930-4472-8a7f-facf76e3e7f5	RS256
offlineSessionMaxLifespanEnabled	a5069552-e930-4472-8a7f-facf76e3e7f5	false
offlineSessionMaxLifespan	a5069552-e930-4472-8a7f-facf76e3e7f5	5184000
actionTokenGeneratedByAdminLifespan	a5069552-e930-4472-8a7f-facf76e3e7f5	43200
actionTokenGeneratedByUserLifespan	a5069552-e930-4472-8a7f-facf76e3e7f5	300
oauth2DeviceCodeLifespan	a5069552-e930-4472-8a7f-facf76e3e7f5	600
oauth2DevicePollingInterval	a5069552-e930-4472-8a7f-facf76e3e7f5	5
webAuthnPolicyRpEntityName	a5069552-e930-4472-8a7f-facf76e3e7f5	keycloak
webAuthnPolicySignatureAlgorithms	a5069552-e930-4472-8a7f-facf76e3e7f5	ES256
webAuthnPolicyRpId	a5069552-e930-4472-8a7f-facf76e3e7f5	
webAuthnPolicyAttestationConveyancePreference	a5069552-e930-4472-8a7f-facf76e3e7f5	not specified
webAuthnPolicyAuthenticatorAttachment	a5069552-e930-4472-8a7f-facf76e3e7f5	not specified
webAuthnPolicyRequireResidentKey	a5069552-e930-4472-8a7f-facf76e3e7f5	not specified
webAuthnPolicyUserVerificationRequirement	a5069552-e930-4472-8a7f-facf76e3e7f5	not specified
webAuthnPolicyCreateTimeout	a5069552-e930-4472-8a7f-facf76e3e7f5	0
webAuthnPolicyAvoidSameAuthenticatorRegister	a5069552-e930-4472-8a7f-facf76e3e7f5	false
webAuthnPolicyRpEntityNamePasswordless	a5069552-e930-4472-8a7f-facf76e3e7f5	keycloak
webAuthnPolicySignatureAlgorithmsPasswordless	a5069552-e930-4472-8a7f-facf76e3e7f5	ES256
webAuthnPolicyRpIdPasswordless	a5069552-e930-4472-8a7f-facf76e3e7f5	
webAuthnPolicyAttestationConveyancePreferencePasswordless	a5069552-e930-4472-8a7f-facf76e3e7f5	not specified
webAuthnPolicyAuthenticatorAttachmentPasswordless	a5069552-e930-4472-8a7f-facf76e3e7f5	not specified
webAuthnPolicyRequireResidentKeyPasswordless	a5069552-e930-4472-8a7f-facf76e3e7f5	not specified
webAuthnPolicyUserVerificationRequirementPasswordless	a5069552-e930-4472-8a7f-facf76e3e7f5	not specified
webAuthnPolicyCreateTimeoutPasswordless	a5069552-e930-4472-8a7f-facf76e3e7f5	0
webAuthnPolicyAvoidSameAuthenticatorRegisterPasswordless	a5069552-e930-4472-8a7f-facf76e3e7f5	false
cibaBackchannelTokenDeliveryMode	a5069552-e930-4472-8a7f-facf76e3e7f5	poll
cibaExpiresIn	a5069552-e930-4472-8a7f-facf76e3e7f5	120
cibaInterval	a5069552-e930-4472-8a7f-facf76e3e7f5	5
cibaAuthRequestedUserHint	a5069552-e930-4472-8a7f-facf76e3e7f5	login_hint
parRequestUriLifespan	a5069552-e930-4472-8a7f-facf76e3e7f5	60
\.


--
-- Data for Name: realm_default_groups; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.realm_default_groups (realm_id, group_id) FROM stdin;
\.


--
-- Data for Name: realm_enabled_event_types; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.realm_enabled_event_types (realm_id, value) FROM stdin;
\.


--
-- Data for Name: realm_events_listeners; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.realm_events_listeners (realm_id, value) FROM stdin;
fd4a6218-c54d-4a98-bddb-08dba17ec4ef	jboss-logging
a5069552-e930-4472-8a7f-facf76e3e7f5	jboss-logging
\.


--
-- Data for Name: realm_localizations; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.realm_localizations (realm_id, locale, texts) FROM stdin;
\.


--
-- Data for Name: realm_required_credential; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.realm_required_credential (type, form_label, input, secret, realm_id) FROM stdin;
password	password	t	t	fd4a6218-c54d-4a98-bddb-08dba17ec4ef
password	password	t	t	a5069552-e930-4472-8a7f-facf76e3e7f5
\.


--
-- Data for Name: realm_smtp_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.realm_smtp_config (realm_id, value, name) FROM stdin;
\.


--
-- Data for Name: realm_supported_locales; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.realm_supported_locales (realm_id, value) FROM stdin;
\.


--
-- Data for Name: redirect_uris; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.redirect_uris (client_id, value) FROM stdin;
cccb0307-df62-466f-a9f0-3813069d9c6c	/realms/master/account/*
89edf3fc-ecca-4425-a996-45dd9e45834d	/realms/master/account/*
42f58925-9b32-4d59-8fb3-f9ec959c68ae	/admin/master/console/*
c8389924-e7d6-4232-b74d-de63f8d43745	/realms/benchmark/account/*
6b5f11f3-9d21-4984-b7b1-5eb23612e671	/realms/benchmark/account/*
eb91b398-177d-447e-b2ee-603f43be4aa3	/admin/benchmark/console/*
\.


--
-- Data for Name: required_action_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.required_action_config (required_action_id, value, name) FROM stdin;
\.


--
-- Data for Name: required_action_provider; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.required_action_provider (id, alias, name, realm_id, enabled, default_action, provider_id, priority) FROM stdin;
177c38ad-3ab8-4e9b-b751-f4ed965118ac	VERIFY_EMAIL	Verify Email	fd4a6218-c54d-4a98-bddb-08dba17ec4ef	t	f	VERIFY_EMAIL	50
92bdc51d-dfd9-4451-b7e8-5646cf75155f	UPDATE_PROFILE	Update Profile	fd4a6218-c54d-4a98-bddb-08dba17ec4ef	t	f	UPDATE_PROFILE	40
cefda95f-e97d-4b20-ba10-e44a4ffb16cd	CONFIGURE_TOTP	Configure OTP	fd4a6218-c54d-4a98-bddb-08dba17ec4ef	t	f	CONFIGURE_TOTP	10
14eef7e1-508a-43e1-aa5c-33c8b1d73016	UPDATE_PASSWORD	Update Password	fd4a6218-c54d-4a98-bddb-08dba17ec4ef	t	f	UPDATE_PASSWORD	30
df98aa21-fceb-4205-9bf1-951e14e4af33	terms_and_conditions	Terms and Conditions	fd4a6218-c54d-4a98-bddb-08dba17ec4ef	f	f	terms_and_conditions	20
b2b33efb-856b-4732-938b-5e01128ff504	update_user_locale	Update User Locale	fd4a6218-c54d-4a98-bddb-08dba17ec4ef	t	f	update_user_locale	1000
6cac8917-de45-490c-9fe9-c617b831085a	delete_account	Delete Account	fd4a6218-c54d-4a98-bddb-08dba17ec4ef	f	f	delete_account	60
3d75276f-6d3d-46c0-8c94-94d7b9791134	webauthn-register	Webauthn Register	fd4a6218-c54d-4a98-bddb-08dba17ec4ef	t	f	webauthn-register	70
1ddcbcaa-0c4f-40b3-a721-3daa7f3cafed	webauthn-register-passwordless	Webauthn Register Passwordless	fd4a6218-c54d-4a98-bddb-08dba17ec4ef	t	f	webauthn-register-passwordless	80
66dc37bd-780e-4904-9518-7b00b50a90a0	VERIFY_EMAIL	Verify Email	a5069552-e930-4472-8a7f-facf76e3e7f5	t	f	VERIFY_EMAIL	50
7754559b-6e6a-4518-8223-f412dfecf5a7	UPDATE_PROFILE	Update Profile	a5069552-e930-4472-8a7f-facf76e3e7f5	t	f	UPDATE_PROFILE	40
d332380c-1302-4fb2-b853-c184fb852d66	CONFIGURE_TOTP	Configure OTP	a5069552-e930-4472-8a7f-facf76e3e7f5	t	f	CONFIGURE_TOTP	10
b4d7b461-e996-40ea-ab4a-f147d9713697	UPDATE_PASSWORD	Update Password	a5069552-e930-4472-8a7f-facf76e3e7f5	t	f	UPDATE_PASSWORD	30
eff5f8e2-47f0-49e5-b58a-b3c9f57a6381	terms_and_conditions	Terms and Conditions	a5069552-e930-4472-8a7f-facf76e3e7f5	f	f	terms_and_conditions	20
ba352cb3-d6f3-46be-9ec8-1c6fc044486f	update_user_locale	Update User Locale	a5069552-e930-4472-8a7f-facf76e3e7f5	t	f	update_user_locale	1000
2dde690e-ca01-4788-bf30-b835f14141e6	delete_account	Delete Account	a5069552-e930-4472-8a7f-facf76e3e7f5	f	f	delete_account	60
f08f34de-ce6d-4dca-b8fe-d229191c2cc3	webauthn-register	Webauthn Register	a5069552-e930-4472-8a7f-facf76e3e7f5	t	f	webauthn-register	70
2b345c4c-bfea-4774-8c56-92320ffa3840	webauthn-register-passwordless	Webauthn Register Passwordless	a5069552-e930-4472-8a7f-facf76e3e7f5	t	f	webauthn-register-passwordless	80
\.


--
-- Data for Name: resource_attribute; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.resource_attribute (id, name, value, resource_id) FROM stdin;
\.


--
-- Data for Name: resource_policy; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.resource_policy (resource_id, policy_id) FROM stdin;
\.


--
-- Data for Name: resource_scope; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.resource_scope (resource_id, scope_id) FROM stdin;
\.


--
-- Data for Name: resource_server; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.resource_server (id, allow_rs_remote_mgmt, policy_enforce_mode, decision_strategy) FROM stdin;
\.


--
-- Data for Name: resource_server_perm_ticket; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.resource_server_perm_ticket (id, owner, requester, created_timestamp, granted_timestamp, resource_id, scope_id, resource_server_id, policy_id) FROM stdin;
\.


--
-- Data for Name: resource_server_policy; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.resource_server_policy (id, name, description, type, decision_strategy, logic, resource_server_id, owner) FROM stdin;
\.


--
-- Data for Name: resource_server_resource; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.resource_server_resource (id, name, type, icon_uri, owner, resource_server_id, owner_managed_access, display_name) FROM stdin;
\.


--
-- Data for Name: resource_server_scope; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.resource_server_scope (id, name, icon_uri, resource_server_id, display_name) FROM stdin;
\.


--
-- Data for Name: resource_uris; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.resource_uris (resource_id, value) FROM stdin;
\.


--
-- Data for Name: role_attribute; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.role_attribute (id, role_id, name, value) FROM stdin;
\.


--
-- Data for Name: scope_mapping; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.scope_mapping (client_id, role_id) FROM stdin;
89edf3fc-ecca-4425-a996-45dd9e45834d	1afb9cf1-486e-4ffd-8685-d222f10eec5e
6b5f11f3-9d21-4984-b7b1-5eb23612e671	73804fa0-9183-42fe-a3a5-1060ca7425e3
\.


--
-- Data for Name: scope_policy; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.scope_policy (scope_id, policy_id) FROM stdin;
\.


--
-- Data for Name: user_attribute; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_attribute (name, value, user_id, id) FROM stdin;
\.


--
-- Data for Name: user_consent; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_consent (id, client_id, user_id, created_date, last_updated_date, client_storage_provider, external_client_id) FROM stdin;
\.


--
-- Data for Name: user_consent_client_scope; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_consent_client_scope (user_consent_id, scope_id) FROM stdin;
\.


--
-- Data for Name: user_entity; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_entity (id, email, email_constraint, email_verified, enabled, federation_link, first_name, last_name, realm_id, username, created_timestamp, service_account_client_link, not_before) FROM stdin;
9fe4e884-63fd-47f4-8427-96bb82746a67	\N	9f5132f3-d953-4d01-b238-c95ab9ca70fe	f	t	\N	\N	\N	fd4a6218-c54d-4a98-bddb-08dba17ec4ef	admin	1665856800064	\N	0
b847960f-efac-4847-9252-c84cd3416441	\N	7eccbe9e-c1bb-486b-9806-8d27d9106c24	f	t	\N	\N	\N	a5069552-e930-4472-8a7f-facf76e3e7f5	service-account-api	1665857124424	13439173-4f6a-4bb7-bdd7-30e70cce2f65	0
\.


--
-- Data for Name: user_federation_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_federation_config (user_federation_provider_id, value, name) FROM stdin;
\.


--
-- Data for Name: user_federation_mapper; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_federation_mapper (id, name, federation_provider_id, federation_mapper_type, realm_id) FROM stdin;
\.


--
-- Data for Name: user_federation_mapper_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_federation_mapper_config (user_federation_mapper_id, value, name) FROM stdin;
\.


--
-- Data for Name: user_federation_provider; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_federation_provider (id, changed_sync_period, display_name, full_sync_period, last_sync, priority, provider_name, realm_id) FROM stdin;
\.


--
-- Data for Name: user_group_membership; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_group_membership (group_id, user_id) FROM stdin;
\.


--
-- Data for Name: user_required_action; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_required_action (user_id, required_action) FROM stdin;
\.


--
-- Data for Name: user_role_mapping; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_role_mapping (role_id, user_id) FROM stdin;
0bede6dd-e745-421f-a443-e2363d61f5e2	9fe4e884-63fd-47f4-8427-96bb82746a67
cfc3fb84-f97b-410d-b816-711da8ba6815	9fe4e884-63fd-47f4-8427-96bb82746a67
08696078-5f3f-48f9-987a-793c6203fcdf	9fe4e884-63fd-47f4-8427-96bb82746a67
f32deb0a-53e5-42d2-a518-c6bb3ea5637b	9fe4e884-63fd-47f4-8427-96bb82746a67
d487d81c-3064-4007-b9b3-e45a17e30992	9fe4e884-63fd-47f4-8427-96bb82746a67
cf956566-3266-4418-a10d-60dbef1cf94d	9fe4e884-63fd-47f4-8427-96bb82746a67
660a287c-531e-4f78-8785-aabbf3c4753a	9fe4e884-63fd-47f4-8427-96bb82746a67
a488e284-69e2-4f26-9215-0c6b0db16865	9fe4e884-63fd-47f4-8427-96bb82746a67
fdd96fdd-3a77-4429-9703-19cd07a0c1bc	9fe4e884-63fd-47f4-8427-96bb82746a67
8929cc25-b7b9-4070-85ed-a2b22361260f	9fe4e884-63fd-47f4-8427-96bb82746a67
dc091829-dd67-4972-86ce-a22926a00861	9fe4e884-63fd-47f4-8427-96bb82746a67
7757473c-b2d3-4d0a-9cc8-7a4ae5c8cfc8	9fe4e884-63fd-47f4-8427-96bb82746a67
4656fae1-1934-4374-b611-a9ad08310662	9fe4e884-63fd-47f4-8427-96bb82746a67
d9bf51c0-84d8-497c-a11d-0017a29d7ec3	9fe4e884-63fd-47f4-8427-96bb82746a67
d4d0c6bb-bf39-43bc-aade-37b8be7edb34	9fe4e884-63fd-47f4-8427-96bb82746a67
a1fc3916-b33f-4546-b3e2-880c5e1fc03e	9fe4e884-63fd-47f4-8427-96bb82746a67
b84c39a4-b5d4-4e62-a6a4-61accd5074c3	9fe4e884-63fd-47f4-8427-96bb82746a67
9c6cc7c7-4f14-4de4-bf24-811adc5768e7	9fe4e884-63fd-47f4-8427-96bb82746a67
ac35566d-7538-4eab-a1fa-cbc6096b527f	9fe4e884-63fd-47f4-8427-96bb82746a67
acff3968-4e16-483c-9471-b13b5ff72b18	b847960f-efac-4847-9252-c84cd3416441
\.


--
-- Data for Name: user_session; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_session (id, auth_method, ip_address, last_session_refresh, login_username, realm_id, remember_me, started, user_id, user_session_state, broker_session_id, broker_user_id) FROM stdin;
\.


--
-- Data for Name: user_session_note; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_session_note (user_session, name, value) FROM stdin;
\.


--
-- Data for Name: username_login_failure; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.username_login_failure (realm_id, username, failed_login_not_before, last_failure, last_ip_failure, num_failures) FROM stdin;
\.


--
-- Data for Name: web_origins; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.web_origins (client_id, value) FROM stdin;
42f58925-9b32-4d59-8fb3-f9ec959c68ae	+
eb91b398-177d-447e-b2ee-603f43be4aa3	+
\.


--
-- Name: username_login_failure CONSTRAINT_17-2; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.username_login_failure
    ADD CONSTRAINT "CONSTRAINT_17-2" PRIMARY KEY (realm_id, username);


--
-- Name: keycloak_role UK_J3RWUVD56ONTGSUHOGM184WW2-2; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.keycloak_role
    ADD CONSTRAINT "UK_J3RWUVD56ONTGSUHOGM184WW2-2" UNIQUE (name, client_realm_constraint);


--
-- Name: client_auth_flow_bindings c_cli_flow_bind; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_auth_flow_bindings
    ADD CONSTRAINT c_cli_flow_bind PRIMARY KEY (client_id, binding_name);


--
-- Name: client_scope_client c_cli_scope_bind; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_scope_client
    ADD CONSTRAINT c_cli_scope_bind PRIMARY KEY (client_id, scope_id);


--
-- Name: client_initial_access cnstr_client_init_acc_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_initial_access
    ADD CONSTRAINT cnstr_client_init_acc_pk PRIMARY KEY (id);


--
-- Name: realm_default_groups con_group_id_def_groups; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_default_groups
    ADD CONSTRAINT con_group_id_def_groups UNIQUE (group_id);


--
-- Name: broker_link constr_broker_link_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.broker_link
    ADD CONSTRAINT constr_broker_link_pk PRIMARY KEY (identity_provider, user_id);


--
-- Name: client_user_session_note constr_cl_usr_ses_note; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_user_session_note
    ADD CONSTRAINT constr_cl_usr_ses_note PRIMARY KEY (client_session, name);


--
-- Name: component_config constr_component_config_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.component_config
    ADD CONSTRAINT constr_component_config_pk PRIMARY KEY (id);


--
-- Name: component constr_component_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.component
    ADD CONSTRAINT constr_component_pk PRIMARY KEY (id);


--
-- Name: fed_user_required_action constr_fed_required_action; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.fed_user_required_action
    ADD CONSTRAINT constr_fed_required_action PRIMARY KEY (required_action, user_id);


--
-- Name: fed_user_attribute constr_fed_user_attr_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.fed_user_attribute
    ADD CONSTRAINT constr_fed_user_attr_pk PRIMARY KEY (id);


--
-- Name: fed_user_consent constr_fed_user_consent_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.fed_user_consent
    ADD CONSTRAINT constr_fed_user_consent_pk PRIMARY KEY (id);


--
-- Name: fed_user_credential constr_fed_user_cred_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.fed_user_credential
    ADD CONSTRAINT constr_fed_user_cred_pk PRIMARY KEY (id);


--
-- Name: fed_user_group_membership constr_fed_user_group; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.fed_user_group_membership
    ADD CONSTRAINT constr_fed_user_group PRIMARY KEY (group_id, user_id);


--
-- Name: fed_user_role_mapping constr_fed_user_role; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.fed_user_role_mapping
    ADD CONSTRAINT constr_fed_user_role PRIMARY KEY (role_id, user_id);


--
-- Name: federated_user constr_federated_user; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.federated_user
    ADD CONSTRAINT constr_federated_user PRIMARY KEY (id);


--
-- Name: realm_default_groups constr_realm_default_groups; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_default_groups
    ADD CONSTRAINT constr_realm_default_groups PRIMARY KEY (realm_id, group_id);


--
-- Name: realm_enabled_event_types constr_realm_enabl_event_types; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_enabled_event_types
    ADD CONSTRAINT constr_realm_enabl_event_types PRIMARY KEY (realm_id, value);


--
-- Name: realm_events_listeners constr_realm_events_listeners; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_events_listeners
    ADD CONSTRAINT constr_realm_events_listeners PRIMARY KEY (realm_id, value);


--
-- Name: realm_supported_locales constr_realm_supported_locales; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_supported_locales
    ADD CONSTRAINT constr_realm_supported_locales PRIMARY KEY (realm_id, value);


--
-- Name: identity_provider constraint_2b; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.identity_provider
    ADD CONSTRAINT constraint_2b PRIMARY KEY (internal_id);


--
-- Name: client_attributes constraint_3c; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_attributes
    ADD CONSTRAINT constraint_3c PRIMARY KEY (client_id, name);


--
-- Name: event_entity constraint_4; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.event_entity
    ADD CONSTRAINT constraint_4 PRIMARY KEY (id);


--
-- Name: federated_identity constraint_40; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.federated_identity
    ADD CONSTRAINT constraint_40 PRIMARY KEY (identity_provider, user_id);


--
-- Name: realm constraint_4a; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm
    ADD CONSTRAINT constraint_4a PRIMARY KEY (id);


--
-- Name: client_session_role constraint_5; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_session_role
    ADD CONSTRAINT constraint_5 PRIMARY KEY (client_session, role_id);


--
-- Name: user_session constraint_57; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_session
    ADD CONSTRAINT constraint_57 PRIMARY KEY (id);


--
-- Name: user_federation_provider constraint_5c; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_federation_provider
    ADD CONSTRAINT constraint_5c PRIMARY KEY (id);


--
-- Name: client_session_note constraint_5e; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_session_note
    ADD CONSTRAINT constraint_5e PRIMARY KEY (client_session, name);


--
-- Name: client constraint_7; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT constraint_7 PRIMARY KEY (id);


--
-- Name: client_session constraint_8; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_session
    ADD CONSTRAINT constraint_8 PRIMARY KEY (id);


--
-- Name: scope_mapping constraint_81; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.scope_mapping
    ADD CONSTRAINT constraint_81 PRIMARY KEY (client_id, role_id);


--
-- Name: client_node_registrations constraint_84; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_node_registrations
    ADD CONSTRAINT constraint_84 PRIMARY KEY (client_id, name);


--
-- Name: realm_attribute constraint_9; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_attribute
    ADD CONSTRAINT constraint_9 PRIMARY KEY (name, realm_id);


--
-- Name: realm_required_credential constraint_92; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_required_credential
    ADD CONSTRAINT constraint_92 PRIMARY KEY (realm_id, type);


--
-- Name: keycloak_role constraint_a; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.keycloak_role
    ADD CONSTRAINT constraint_a PRIMARY KEY (id);


--
-- Name: admin_event_entity constraint_admin_event_entity; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.admin_event_entity
    ADD CONSTRAINT constraint_admin_event_entity PRIMARY KEY (id);


--
-- Name: authenticator_config_entry constraint_auth_cfg_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.authenticator_config_entry
    ADD CONSTRAINT constraint_auth_cfg_pk PRIMARY KEY (authenticator_id, name);


--
-- Name: authentication_execution constraint_auth_exec_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.authentication_execution
    ADD CONSTRAINT constraint_auth_exec_pk PRIMARY KEY (id);


--
-- Name: authentication_flow constraint_auth_flow_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.authentication_flow
    ADD CONSTRAINT constraint_auth_flow_pk PRIMARY KEY (id);


--
-- Name: authenticator_config constraint_auth_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.authenticator_config
    ADD CONSTRAINT constraint_auth_pk PRIMARY KEY (id);


--
-- Name: client_session_auth_status constraint_auth_status_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_session_auth_status
    ADD CONSTRAINT constraint_auth_status_pk PRIMARY KEY (client_session, authenticator);


--
-- Name: user_role_mapping constraint_c; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_role_mapping
    ADD CONSTRAINT constraint_c PRIMARY KEY (role_id, user_id);


--
-- Name: composite_role constraint_composite_role; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.composite_role
    ADD CONSTRAINT constraint_composite_role PRIMARY KEY (composite, child_role);


--
-- Name: client_session_prot_mapper constraint_cs_pmp_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_session_prot_mapper
    ADD CONSTRAINT constraint_cs_pmp_pk PRIMARY KEY (client_session, protocol_mapper_id);


--
-- Name: identity_provider_config constraint_d; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.identity_provider_config
    ADD CONSTRAINT constraint_d PRIMARY KEY (identity_provider_id, name);


--
-- Name: policy_config constraint_dpc; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.policy_config
    ADD CONSTRAINT constraint_dpc PRIMARY KEY (policy_id, name);


--
-- Name: realm_smtp_config constraint_e; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_smtp_config
    ADD CONSTRAINT constraint_e PRIMARY KEY (realm_id, name);


--
-- Name: credential constraint_f; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.credential
    ADD CONSTRAINT constraint_f PRIMARY KEY (id);


--
-- Name: user_federation_config constraint_f9; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_federation_config
    ADD CONSTRAINT constraint_f9 PRIMARY KEY (user_federation_provider_id, name);


--
-- Name: resource_server_perm_ticket constraint_fapmt; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT constraint_fapmt PRIMARY KEY (id);


--
-- Name: resource_server_resource constraint_farsr; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_resource
    ADD CONSTRAINT constraint_farsr PRIMARY KEY (id);


--
-- Name: resource_server_policy constraint_farsrp; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_policy
    ADD CONSTRAINT constraint_farsrp PRIMARY KEY (id);


--
-- Name: associated_policy constraint_farsrpap; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.associated_policy
    ADD CONSTRAINT constraint_farsrpap PRIMARY KEY (policy_id, associated_policy_id);


--
-- Name: resource_policy constraint_farsrpp; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_policy
    ADD CONSTRAINT constraint_farsrpp PRIMARY KEY (resource_id, policy_id);


--
-- Name: resource_server_scope constraint_farsrs; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_scope
    ADD CONSTRAINT constraint_farsrs PRIMARY KEY (id);


--
-- Name: resource_scope constraint_farsrsp; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_scope
    ADD CONSTRAINT constraint_farsrsp PRIMARY KEY (resource_id, scope_id);


--
-- Name: scope_policy constraint_farsrsps; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.scope_policy
    ADD CONSTRAINT constraint_farsrsps PRIMARY KEY (scope_id, policy_id);


--
-- Name: user_entity constraint_fb; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_entity
    ADD CONSTRAINT constraint_fb PRIMARY KEY (id);


--
-- Name: user_federation_mapper_config constraint_fedmapper_cfg_pm; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_federation_mapper_config
    ADD CONSTRAINT constraint_fedmapper_cfg_pm PRIMARY KEY (user_federation_mapper_id, name);


--
-- Name: user_federation_mapper constraint_fedmapperpm; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_federation_mapper
    ADD CONSTRAINT constraint_fedmapperpm PRIMARY KEY (id);


--
-- Name: fed_user_consent_cl_scope constraint_fgrntcsnt_clsc_pm; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.fed_user_consent_cl_scope
    ADD CONSTRAINT constraint_fgrntcsnt_clsc_pm PRIMARY KEY (user_consent_id, scope_id);


--
-- Name: user_consent_client_scope constraint_grntcsnt_clsc_pm; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_consent_client_scope
    ADD CONSTRAINT constraint_grntcsnt_clsc_pm PRIMARY KEY (user_consent_id, scope_id);


--
-- Name: user_consent constraint_grntcsnt_pm; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_consent
    ADD CONSTRAINT constraint_grntcsnt_pm PRIMARY KEY (id);


--
-- Name: keycloak_group constraint_group; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.keycloak_group
    ADD CONSTRAINT constraint_group PRIMARY KEY (id);


--
-- Name: group_attribute constraint_group_attribute_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.group_attribute
    ADD CONSTRAINT constraint_group_attribute_pk PRIMARY KEY (id);


--
-- Name: group_role_mapping constraint_group_role; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.group_role_mapping
    ADD CONSTRAINT constraint_group_role PRIMARY KEY (role_id, group_id);


--
-- Name: identity_provider_mapper constraint_idpm; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.identity_provider_mapper
    ADD CONSTRAINT constraint_idpm PRIMARY KEY (id);


--
-- Name: idp_mapper_config constraint_idpmconfig; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.idp_mapper_config
    ADD CONSTRAINT constraint_idpmconfig PRIMARY KEY (idp_mapper_id, name);


--
-- Name: migration_model constraint_migmod; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.migration_model
    ADD CONSTRAINT constraint_migmod PRIMARY KEY (id);


--
-- Name: offline_client_session constraint_offl_cl_ses_pk3; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.offline_client_session
    ADD CONSTRAINT constraint_offl_cl_ses_pk3 PRIMARY KEY (user_session_id, client_id, client_storage_provider, external_client_id, offline_flag);


--
-- Name: offline_user_session constraint_offl_us_ses_pk2; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.offline_user_session
    ADD CONSTRAINT constraint_offl_us_ses_pk2 PRIMARY KEY (user_session_id, offline_flag);


--
-- Name: protocol_mapper constraint_pcm; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.protocol_mapper
    ADD CONSTRAINT constraint_pcm PRIMARY KEY (id);


--
-- Name: protocol_mapper_config constraint_pmconfig; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.protocol_mapper_config
    ADD CONSTRAINT constraint_pmconfig PRIMARY KEY (protocol_mapper_id, name);


--
-- Name: redirect_uris constraint_redirect_uris; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.redirect_uris
    ADD CONSTRAINT constraint_redirect_uris PRIMARY KEY (client_id, value);


--
-- Name: required_action_config constraint_req_act_cfg_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.required_action_config
    ADD CONSTRAINT constraint_req_act_cfg_pk PRIMARY KEY (required_action_id, name);


--
-- Name: required_action_provider constraint_req_act_prv_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.required_action_provider
    ADD CONSTRAINT constraint_req_act_prv_pk PRIMARY KEY (id);


--
-- Name: user_required_action constraint_required_action; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_required_action
    ADD CONSTRAINT constraint_required_action PRIMARY KEY (required_action, user_id);


--
-- Name: resource_uris constraint_resour_uris_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_uris
    ADD CONSTRAINT constraint_resour_uris_pk PRIMARY KEY (resource_id, value);


--
-- Name: role_attribute constraint_role_attribute_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.role_attribute
    ADD CONSTRAINT constraint_role_attribute_pk PRIMARY KEY (id);


--
-- Name: user_attribute constraint_user_attribute_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_attribute
    ADD CONSTRAINT constraint_user_attribute_pk PRIMARY KEY (id);


--
-- Name: user_group_membership constraint_user_group; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_group_membership
    ADD CONSTRAINT constraint_user_group PRIMARY KEY (group_id, user_id);


--
-- Name: user_session_note constraint_usn_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_session_note
    ADD CONSTRAINT constraint_usn_pk PRIMARY KEY (user_session, name);


--
-- Name: web_origins constraint_web_origins; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.web_origins
    ADD CONSTRAINT constraint_web_origins PRIMARY KEY (client_id, value);


--
-- Name: databasechangeloglock databasechangeloglock_pkey; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.databasechangeloglock
    ADD CONSTRAINT databasechangeloglock_pkey PRIMARY KEY (id);


--
-- Name: client_scope_attributes pk_cl_tmpl_attr; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_scope_attributes
    ADD CONSTRAINT pk_cl_tmpl_attr PRIMARY KEY (scope_id, name);


--
-- Name: client_scope pk_cli_template; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_scope
    ADD CONSTRAINT pk_cli_template PRIMARY KEY (id);


--
-- Name: resource_server pk_resource_server; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server
    ADD CONSTRAINT pk_resource_server PRIMARY KEY (id);


--
-- Name: client_scope_role_mapping pk_template_scope; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_scope_role_mapping
    ADD CONSTRAINT pk_template_scope PRIMARY KEY (scope_id, role_id);


--
-- Name: default_client_scope r_def_cli_scope_bind; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.default_client_scope
    ADD CONSTRAINT r_def_cli_scope_bind PRIMARY KEY (realm_id, scope_id);


--
-- Name: realm_localizations realm_localizations_pkey; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_localizations
    ADD CONSTRAINT realm_localizations_pkey PRIMARY KEY (realm_id, locale);


--
-- Name: resource_attribute res_attr_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_attribute
    ADD CONSTRAINT res_attr_pk PRIMARY KEY (id);


--
-- Name: keycloak_group sibling_names; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.keycloak_group
    ADD CONSTRAINT sibling_names UNIQUE (realm_id, parent_group, name);


--
-- Name: identity_provider uk_2daelwnibji49avxsrtuf6xj33; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.identity_provider
    ADD CONSTRAINT uk_2daelwnibji49avxsrtuf6xj33 UNIQUE (provider_alias, realm_id);


--
-- Name: client uk_b71cjlbenv945rb6gcon438at; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT uk_b71cjlbenv945rb6gcon438at UNIQUE (realm_id, client_id);


--
-- Name: client_scope uk_cli_scope; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_scope
    ADD CONSTRAINT uk_cli_scope UNIQUE (realm_id, name);


--
-- Name: user_entity uk_dykn684sl8up1crfei6eckhd7; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_entity
    ADD CONSTRAINT uk_dykn684sl8up1crfei6eckhd7 UNIQUE (realm_id, email_constraint);


--
-- Name: resource_server_resource uk_frsr6t700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_resource
    ADD CONSTRAINT uk_frsr6t700s9v50bu18ws5ha6 UNIQUE (name, owner, resource_server_id);


--
-- Name: resource_server_perm_ticket uk_frsr6t700s9v50bu18ws5pmt; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT uk_frsr6t700s9v50bu18ws5pmt UNIQUE (owner, requester, resource_server_id, resource_id, scope_id);


--
-- Name: resource_server_policy uk_frsrpt700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_policy
    ADD CONSTRAINT uk_frsrpt700s9v50bu18ws5ha6 UNIQUE (name, resource_server_id);


--
-- Name: resource_server_scope uk_frsrst700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_scope
    ADD CONSTRAINT uk_frsrst700s9v50bu18ws5ha6 UNIQUE (name, resource_server_id);


--
-- Name: user_consent uk_jkuwuvd56ontgsuhogm8uewrt; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_consent
    ADD CONSTRAINT uk_jkuwuvd56ontgsuhogm8uewrt UNIQUE (client_id, client_storage_provider, external_client_id, user_id);


--
-- Name: realm uk_orvsdmla56612eaefiq6wl5oi; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm
    ADD CONSTRAINT uk_orvsdmla56612eaefiq6wl5oi UNIQUE (name);


--
-- Name: user_entity uk_ru8tt6t700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_entity
    ADD CONSTRAINT uk_ru8tt6t700s9v50bu18ws5ha6 UNIQUE (realm_id, username);


--
-- Name: idx_admin_event_time; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_admin_event_time ON public.admin_event_entity USING btree (realm_id, admin_event_time);


--
-- Name: idx_assoc_pol_assoc_pol_id; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_assoc_pol_assoc_pol_id ON public.associated_policy USING btree (associated_policy_id);


--
-- Name: idx_auth_config_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_auth_config_realm ON public.authenticator_config USING btree (realm_id);


--
-- Name: idx_auth_exec_flow; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_auth_exec_flow ON public.authentication_execution USING btree (flow_id);


--
-- Name: idx_auth_exec_realm_flow; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_auth_exec_realm_flow ON public.authentication_execution USING btree (realm_id, flow_id);


--
-- Name: idx_auth_flow_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_auth_flow_realm ON public.authentication_flow USING btree (realm_id);


--
-- Name: idx_cl_clscope; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_cl_clscope ON public.client_scope_client USING btree (scope_id);


--
-- Name: idx_client_att_by_name_value; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_client_att_by_name_value ON public.client_attributes USING btree (name, ((value)::character varying(250)));


--
-- Name: idx_client_id; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_client_id ON public.client USING btree (client_id);


--
-- Name: idx_client_init_acc_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_client_init_acc_realm ON public.client_initial_access USING btree (realm_id);


--
-- Name: idx_client_session_session; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_client_session_session ON public.client_session USING btree (session_id);


--
-- Name: idx_clscope_attrs; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_clscope_attrs ON public.client_scope_attributes USING btree (scope_id);


--
-- Name: idx_clscope_cl; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_clscope_cl ON public.client_scope_client USING btree (client_id);


--
-- Name: idx_clscope_protmap; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_clscope_protmap ON public.protocol_mapper USING btree (client_scope_id);


--
-- Name: idx_clscope_role; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_clscope_role ON public.client_scope_role_mapping USING btree (scope_id);


--
-- Name: idx_compo_config_compo; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_compo_config_compo ON public.component_config USING btree (component_id);


--
-- Name: idx_component_provider_type; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_component_provider_type ON public.component USING btree (provider_type);


--
-- Name: idx_component_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_component_realm ON public.component USING btree (realm_id);


--
-- Name: idx_composite; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_composite ON public.composite_role USING btree (composite);


--
-- Name: idx_composite_child; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_composite_child ON public.composite_role USING btree (child_role);


--
-- Name: idx_defcls_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_defcls_realm ON public.default_client_scope USING btree (realm_id);


--
-- Name: idx_defcls_scope; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_defcls_scope ON public.default_client_scope USING btree (scope_id);


--
-- Name: idx_event_time; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_event_time ON public.event_entity USING btree (realm_id, event_time);


--
-- Name: idx_fedidentity_feduser; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fedidentity_feduser ON public.federated_identity USING btree (federated_user_id);


--
-- Name: idx_fedidentity_user; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fedidentity_user ON public.federated_identity USING btree (user_id);


--
-- Name: idx_fu_attribute; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_attribute ON public.fed_user_attribute USING btree (user_id, realm_id, name);


--
-- Name: idx_fu_cnsnt_ext; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_cnsnt_ext ON public.fed_user_consent USING btree (user_id, client_storage_provider, external_client_id);


--
-- Name: idx_fu_consent; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_consent ON public.fed_user_consent USING btree (user_id, client_id);


--
-- Name: idx_fu_consent_ru; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_consent_ru ON public.fed_user_consent USING btree (realm_id, user_id);


--
-- Name: idx_fu_credential; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_credential ON public.fed_user_credential USING btree (user_id, type);


--
-- Name: idx_fu_credential_ru; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_credential_ru ON public.fed_user_credential USING btree (realm_id, user_id);


--
-- Name: idx_fu_group_membership; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_group_membership ON public.fed_user_group_membership USING btree (user_id, group_id);


--
-- Name: idx_fu_group_membership_ru; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_group_membership_ru ON public.fed_user_group_membership USING btree (realm_id, user_id);


--
-- Name: idx_fu_required_action; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_required_action ON public.fed_user_required_action USING btree (user_id, required_action);


--
-- Name: idx_fu_required_action_ru; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_required_action_ru ON public.fed_user_required_action USING btree (realm_id, user_id);


--
-- Name: idx_fu_role_mapping; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_role_mapping ON public.fed_user_role_mapping USING btree (user_id, role_id);


--
-- Name: idx_fu_role_mapping_ru; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_role_mapping_ru ON public.fed_user_role_mapping USING btree (realm_id, user_id);


--
-- Name: idx_group_attr_group; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_group_attr_group ON public.group_attribute USING btree (group_id);


--
-- Name: idx_group_role_mapp_group; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_group_role_mapp_group ON public.group_role_mapping USING btree (group_id);


--
-- Name: idx_id_prov_mapp_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_id_prov_mapp_realm ON public.identity_provider_mapper USING btree (realm_id);


--
-- Name: idx_ident_prov_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_ident_prov_realm ON public.identity_provider USING btree (realm_id);


--
-- Name: idx_keycloak_role_client; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_keycloak_role_client ON public.keycloak_role USING btree (client);


--
-- Name: idx_keycloak_role_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_keycloak_role_realm ON public.keycloak_role USING btree (realm);


--
-- Name: idx_offline_css_preload; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_offline_css_preload ON public.offline_client_session USING btree (client_id, offline_flag);


--
-- Name: idx_offline_uss_by_user; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_offline_uss_by_user ON public.offline_user_session USING btree (user_id, realm_id, offline_flag);


--
-- Name: idx_offline_uss_by_usersess; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_offline_uss_by_usersess ON public.offline_user_session USING btree (realm_id, offline_flag, user_session_id);


--
-- Name: idx_offline_uss_createdon; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_offline_uss_createdon ON public.offline_user_session USING btree (created_on);


--
-- Name: idx_offline_uss_preload; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_offline_uss_preload ON public.offline_user_session USING btree (offline_flag, created_on, user_session_id);


--
-- Name: idx_protocol_mapper_client; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_protocol_mapper_client ON public.protocol_mapper USING btree (client_id);


--
-- Name: idx_realm_attr_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_realm_attr_realm ON public.realm_attribute USING btree (realm_id);


--
-- Name: idx_realm_clscope; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_realm_clscope ON public.client_scope USING btree (realm_id);


--
-- Name: idx_realm_def_grp_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_realm_def_grp_realm ON public.realm_default_groups USING btree (realm_id);


--
-- Name: idx_realm_evt_list_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_realm_evt_list_realm ON public.realm_events_listeners USING btree (realm_id);


--
-- Name: idx_realm_evt_types_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_realm_evt_types_realm ON public.realm_enabled_event_types USING btree (realm_id);


--
-- Name: idx_realm_master_adm_cli; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_realm_master_adm_cli ON public.realm USING btree (master_admin_client);


--
-- Name: idx_realm_supp_local_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_realm_supp_local_realm ON public.realm_supported_locales USING btree (realm_id);


--
-- Name: idx_redir_uri_client; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_redir_uri_client ON public.redirect_uris USING btree (client_id);


--
-- Name: idx_req_act_prov_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_req_act_prov_realm ON public.required_action_provider USING btree (realm_id);


--
-- Name: idx_res_policy_policy; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_res_policy_policy ON public.resource_policy USING btree (policy_id);


--
-- Name: idx_res_scope_scope; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_res_scope_scope ON public.resource_scope USING btree (scope_id);


--
-- Name: idx_res_serv_pol_res_serv; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_res_serv_pol_res_serv ON public.resource_server_policy USING btree (resource_server_id);


--
-- Name: idx_res_srv_res_res_srv; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_res_srv_res_res_srv ON public.resource_server_resource USING btree (resource_server_id);


--
-- Name: idx_res_srv_scope_res_srv; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_res_srv_scope_res_srv ON public.resource_server_scope USING btree (resource_server_id);


--
-- Name: idx_role_attribute; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_role_attribute ON public.role_attribute USING btree (role_id);


--
-- Name: idx_role_clscope; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_role_clscope ON public.client_scope_role_mapping USING btree (role_id);


--
-- Name: idx_scope_mapping_role; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_scope_mapping_role ON public.scope_mapping USING btree (role_id);


--
-- Name: idx_scope_policy_policy; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_scope_policy_policy ON public.scope_policy USING btree (policy_id);


--
-- Name: idx_update_time; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_update_time ON public.migration_model USING btree (update_time);


--
-- Name: idx_us_sess_id_on_cl_sess; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_us_sess_id_on_cl_sess ON public.offline_client_session USING btree (user_session_id);


--
-- Name: idx_usconsent_clscope; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_usconsent_clscope ON public.user_consent_client_scope USING btree (user_consent_id);


--
-- Name: idx_user_attribute; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_user_attribute ON public.user_attribute USING btree (user_id);


--
-- Name: idx_user_attribute_name; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_user_attribute_name ON public.user_attribute USING btree (name, value);


--
-- Name: idx_user_consent; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_user_consent ON public.user_consent USING btree (user_id);


--
-- Name: idx_user_credential; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_user_credential ON public.credential USING btree (user_id);


--
-- Name: idx_user_email; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_user_email ON public.user_entity USING btree (email);


--
-- Name: idx_user_group_mapping; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_user_group_mapping ON public.user_group_membership USING btree (user_id);


--
-- Name: idx_user_reqactions; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_user_reqactions ON public.user_required_action USING btree (user_id);


--
-- Name: idx_user_role_mapping; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_user_role_mapping ON public.user_role_mapping USING btree (user_id);


--
-- Name: idx_user_service_account; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_user_service_account ON public.user_entity USING btree (realm_id, service_account_client_link);


--
-- Name: idx_usr_fed_map_fed_prv; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_usr_fed_map_fed_prv ON public.user_federation_mapper USING btree (federation_provider_id);


--
-- Name: idx_usr_fed_map_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_usr_fed_map_realm ON public.user_federation_mapper USING btree (realm_id);


--
-- Name: idx_usr_fed_prv_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_usr_fed_prv_realm ON public.user_federation_provider USING btree (realm_id);


--
-- Name: idx_web_orig_client; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_web_orig_client ON public.web_origins USING btree (client_id);


--
-- Name: client_session_auth_status auth_status_constraint; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_session_auth_status
    ADD CONSTRAINT auth_status_constraint FOREIGN KEY (client_session) REFERENCES public.client_session(id);


--
-- Name: identity_provider fk2b4ebc52ae5c3b34; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.identity_provider
    ADD CONSTRAINT fk2b4ebc52ae5c3b34 FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: client_attributes fk3c47c64beacca966; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_attributes
    ADD CONSTRAINT fk3c47c64beacca966 FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: federated_identity fk404288b92ef007a6; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.federated_identity
    ADD CONSTRAINT fk404288b92ef007a6 FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: client_node_registrations fk4129723ba992f594; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_node_registrations
    ADD CONSTRAINT fk4129723ba992f594 FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: client_session_note fk5edfb00ff51c2736; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_session_note
    ADD CONSTRAINT fk5edfb00ff51c2736 FOREIGN KEY (client_session) REFERENCES public.client_session(id);


--
-- Name: user_session_note fk5edfb00ff51d3472; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_session_note
    ADD CONSTRAINT fk5edfb00ff51d3472 FOREIGN KEY (user_session) REFERENCES public.user_session(id);


--
-- Name: client_session_role fk_11b7sgqw18i532811v7o2dv76; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_session_role
    ADD CONSTRAINT fk_11b7sgqw18i532811v7o2dv76 FOREIGN KEY (client_session) REFERENCES public.client_session(id);


--
-- Name: redirect_uris fk_1burs8pb4ouj97h5wuppahv9f; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.redirect_uris
    ADD CONSTRAINT fk_1burs8pb4ouj97h5wuppahv9f FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: user_federation_provider fk_1fj32f6ptolw2qy60cd8n01e8; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_federation_provider
    ADD CONSTRAINT fk_1fj32f6ptolw2qy60cd8n01e8 FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: client_session_prot_mapper fk_33a8sgqw18i532811v7o2dk89; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_session_prot_mapper
    ADD CONSTRAINT fk_33a8sgqw18i532811v7o2dk89 FOREIGN KEY (client_session) REFERENCES public.client_session(id);


--
-- Name: realm_required_credential fk_5hg65lybevavkqfki3kponh9v; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_required_credential
    ADD CONSTRAINT fk_5hg65lybevavkqfki3kponh9v FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: resource_attribute fk_5hrm2vlf9ql5fu022kqepovbr; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_attribute
    ADD CONSTRAINT fk_5hrm2vlf9ql5fu022kqepovbr FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- Name: user_attribute fk_5hrm2vlf9ql5fu043kqepovbr; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_attribute
    ADD CONSTRAINT fk_5hrm2vlf9ql5fu043kqepovbr FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: user_required_action fk_6qj3w1jw9cvafhe19bwsiuvmd; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_required_action
    ADD CONSTRAINT fk_6qj3w1jw9cvafhe19bwsiuvmd FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: keycloak_role fk_6vyqfe4cn4wlq8r6kt5vdsj5c; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.keycloak_role
    ADD CONSTRAINT fk_6vyqfe4cn4wlq8r6kt5vdsj5c FOREIGN KEY (realm) REFERENCES public.realm(id);


--
-- Name: realm_smtp_config fk_70ej8xdxgxd0b9hh6180irr0o; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_smtp_config
    ADD CONSTRAINT fk_70ej8xdxgxd0b9hh6180irr0o FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: realm_attribute fk_8shxd6l3e9atqukacxgpffptw; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_attribute
    ADD CONSTRAINT fk_8shxd6l3e9atqukacxgpffptw FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: composite_role fk_a63wvekftu8jo1pnj81e7mce2; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.composite_role
    ADD CONSTRAINT fk_a63wvekftu8jo1pnj81e7mce2 FOREIGN KEY (composite) REFERENCES public.keycloak_role(id);


--
-- Name: authentication_execution fk_auth_exec_flow; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.authentication_execution
    ADD CONSTRAINT fk_auth_exec_flow FOREIGN KEY (flow_id) REFERENCES public.authentication_flow(id);


--
-- Name: authentication_execution fk_auth_exec_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.authentication_execution
    ADD CONSTRAINT fk_auth_exec_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: authentication_flow fk_auth_flow_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.authentication_flow
    ADD CONSTRAINT fk_auth_flow_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: authenticator_config fk_auth_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.authenticator_config
    ADD CONSTRAINT fk_auth_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: client_session fk_b4ao2vcvat6ukau74wbwtfqo1; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_session
    ADD CONSTRAINT fk_b4ao2vcvat6ukau74wbwtfqo1 FOREIGN KEY (session_id) REFERENCES public.user_session(id);


--
-- Name: user_role_mapping fk_c4fqv34p1mbylloxang7b1q3l; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_role_mapping
    ADD CONSTRAINT fk_c4fqv34p1mbylloxang7b1q3l FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: client_scope_attributes fk_cl_scope_attr_scope; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_scope_attributes
    ADD CONSTRAINT fk_cl_scope_attr_scope FOREIGN KEY (scope_id) REFERENCES public.client_scope(id);


--
-- Name: client_scope_role_mapping fk_cl_scope_rm_scope; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_scope_role_mapping
    ADD CONSTRAINT fk_cl_scope_rm_scope FOREIGN KEY (scope_id) REFERENCES public.client_scope(id);


--
-- Name: client_user_session_note fk_cl_usr_ses_note; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_user_session_note
    ADD CONSTRAINT fk_cl_usr_ses_note FOREIGN KEY (client_session) REFERENCES public.client_session(id);


--
-- Name: protocol_mapper fk_cli_scope_mapper; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.protocol_mapper
    ADD CONSTRAINT fk_cli_scope_mapper FOREIGN KEY (client_scope_id) REFERENCES public.client_scope(id);


--
-- Name: client_initial_access fk_client_init_acc_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_initial_access
    ADD CONSTRAINT fk_client_init_acc_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: component_config fk_component_config; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.component_config
    ADD CONSTRAINT fk_component_config FOREIGN KEY (component_id) REFERENCES public.component(id);


--
-- Name: component fk_component_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.component
    ADD CONSTRAINT fk_component_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: realm_default_groups fk_def_groups_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_default_groups
    ADD CONSTRAINT fk_def_groups_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: user_federation_mapper_config fk_fedmapper_cfg; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_federation_mapper_config
    ADD CONSTRAINT fk_fedmapper_cfg FOREIGN KEY (user_federation_mapper_id) REFERENCES public.user_federation_mapper(id);


--
-- Name: user_federation_mapper fk_fedmapperpm_fedprv; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_federation_mapper
    ADD CONSTRAINT fk_fedmapperpm_fedprv FOREIGN KEY (federation_provider_id) REFERENCES public.user_federation_provider(id);


--
-- Name: user_federation_mapper fk_fedmapperpm_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_federation_mapper
    ADD CONSTRAINT fk_fedmapperpm_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: associated_policy fk_frsr5s213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.associated_policy
    ADD CONSTRAINT fk_frsr5s213xcx4wnkog82ssrfy FOREIGN KEY (associated_policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: scope_policy fk_frsrasp13xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.scope_policy
    ADD CONSTRAINT fk_frsrasp13xcx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: resource_server_perm_ticket fk_frsrho213xcx4wnkog82sspmt; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrho213xcx4wnkog82sspmt FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);


--
-- Name: resource_server_resource fk_frsrho213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_resource
    ADD CONSTRAINT fk_frsrho213xcx4wnkog82ssrfy FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);


--
-- Name: resource_server_perm_ticket fk_frsrho213xcx4wnkog83sspmt; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrho213xcx4wnkog83sspmt FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- Name: resource_server_perm_ticket fk_frsrho213xcx4wnkog84sspmt; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrho213xcx4wnkog84sspmt FOREIGN KEY (scope_id) REFERENCES public.resource_server_scope(id);


--
-- Name: associated_policy fk_frsrpas14xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.associated_policy
    ADD CONSTRAINT fk_frsrpas14xcx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: scope_policy fk_frsrpass3xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.scope_policy
    ADD CONSTRAINT fk_frsrpass3xcx4wnkog82ssrfy FOREIGN KEY (scope_id) REFERENCES public.resource_server_scope(id);


--
-- Name: resource_server_perm_ticket fk_frsrpo2128cx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrpo2128cx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: resource_server_policy fk_frsrpo213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_policy
    ADD CONSTRAINT fk_frsrpo213xcx4wnkog82ssrfy FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);


--
-- Name: resource_scope fk_frsrpos13xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_scope
    ADD CONSTRAINT fk_frsrpos13xcx4wnkog82ssrfy FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- Name: resource_policy fk_frsrpos53xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_policy
    ADD CONSTRAINT fk_frsrpos53xcx4wnkog82ssrfy FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- Name: resource_policy fk_frsrpp213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_policy
    ADD CONSTRAINT fk_frsrpp213xcx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: resource_scope fk_frsrps213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_scope
    ADD CONSTRAINT fk_frsrps213xcx4wnkog82ssrfy FOREIGN KEY (scope_id) REFERENCES public.resource_server_scope(id);


--
-- Name: resource_server_scope fk_frsrso213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_scope
    ADD CONSTRAINT fk_frsrso213xcx4wnkog82ssrfy FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);


--
-- Name: composite_role fk_gr7thllb9lu8q4vqa4524jjy8; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.composite_role
    ADD CONSTRAINT fk_gr7thllb9lu8q4vqa4524jjy8 FOREIGN KEY (child_role) REFERENCES public.keycloak_role(id);


--
-- Name: user_consent_client_scope fk_grntcsnt_clsc_usc; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_consent_client_scope
    ADD CONSTRAINT fk_grntcsnt_clsc_usc FOREIGN KEY (user_consent_id) REFERENCES public.user_consent(id);


--
-- Name: user_consent fk_grntcsnt_user; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_consent
    ADD CONSTRAINT fk_grntcsnt_user FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: group_attribute fk_group_attribute_group; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.group_attribute
    ADD CONSTRAINT fk_group_attribute_group FOREIGN KEY (group_id) REFERENCES public.keycloak_group(id);


--
-- Name: group_role_mapping fk_group_role_group; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.group_role_mapping
    ADD CONSTRAINT fk_group_role_group FOREIGN KEY (group_id) REFERENCES public.keycloak_group(id);


--
-- Name: realm_enabled_event_types fk_h846o4h0w8epx5nwedrf5y69j; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_enabled_event_types
    ADD CONSTRAINT fk_h846o4h0w8epx5nwedrf5y69j FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: realm_events_listeners fk_h846o4h0w8epx5nxev9f5y69j; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_events_listeners
    ADD CONSTRAINT fk_h846o4h0w8epx5nxev9f5y69j FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: identity_provider_mapper fk_idpm_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.identity_provider_mapper
    ADD CONSTRAINT fk_idpm_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: idp_mapper_config fk_idpmconfig; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.idp_mapper_config
    ADD CONSTRAINT fk_idpmconfig FOREIGN KEY (idp_mapper_id) REFERENCES public.identity_provider_mapper(id);


--
-- Name: web_origins fk_lojpho213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.web_origins
    ADD CONSTRAINT fk_lojpho213xcx4wnkog82ssrfy FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: scope_mapping fk_ouse064plmlr732lxjcn1q5f1; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.scope_mapping
    ADD CONSTRAINT fk_ouse064plmlr732lxjcn1q5f1 FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: protocol_mapper fk_pcm_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.protocol_mapper
    ADD CONSTRAINT fk_pcm_realm FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: credential fk_pfyr0glasqyl0dei3kl69r6v0; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.credential
    ADD CONSTRAINT fk_pfyr0glasqyl0dei3kl69r6v0 FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: protocol_mapper_config fk_pmconfig; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.protocol_mapper_config
    ADD CONSTRAINT fk_pmconfig FOREIGN KEY (protocol_mapper_id) REFERENCES public.protocol_mapper(id);


--
-- Name: default_client_scope fk_r_def_cli_scope_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.default_client_scope
    ADD CONSTRAINT fk_r_def_cli_scope_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: required_action_provider fk_req_act_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.required_action_provider
    ADD CONSTRAINT fk_req_act_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: resource_uris fk_resource_server_uris; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_uris
    ADD CONSTRAINT fk_resource_server_uris FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- Name: role_attribute fk_role_attribute_id; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.role_attribute
    ADD CONSTRAINT fk_role_attribute_id FOREIGN KEY (role_id) REFERENCES public.keycloak_role(id);


--
-- Name: realm_supported_locales fk_supported_locales_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_supported_locales
    ADD CONSTRAINT fk_supported_locales_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: user_federation_config fk_t13hpu1j94r2ebpekr39x5eu5; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_federation_config
    ADD CONSTRAINT fk_t13hpu1j94r2ebpekr39x5eu5 FOREIGN KEY (user_federation_provider_id) REFERENCES public.user_federation_provider(id);


--
-- Name: user_group_membership fk_user_group_user; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_group_membership
    ADD CONSTRAINT fk_user_group_user FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: policy_config fkdc34197cf864c4e43; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.policy_config
    ADD CONSTRAINT fkdc34197cf864c4e43 FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: identity_provider_config fkdc4897cf864c4e43; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.identity_provider_config
    ADD CONSTRAINT fkdc4897cf864c4e43 FOREIGN KEY (identity_provider_id) REFERENCES public.identity_provider(internal_id);


--
-- PostgreSQL database dump complete
--

