--
-- PostgreSQL database cluster dump
--

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Drop databases (except postgres and template1)
--





--
-- Drop roles
--

DROP ROLE postgres;


--
-- Roles
--

CREATE ROLE postgres;
ALTER ROLE postgres WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS PASSWORD 'md53175bce1d3201d16594cebf9d7eb3f9d';






--
-- Databases
--

--
-- Database "template1" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 12.4 (Debian 12.4-1.pgdg100+1)
-- Dumped by pg_dump version 12.4 (Debian 12.4-1.pgdg100+1)

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

UPDATE pg_catalog.pg_database SET datistemplate = false WHERE datname = 'template1';
DROP DATABASE template1;
--
-- Name: template1; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE template1 WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.utf8' LC_CTYPE = 'en_US.utf8';


ALTER DATABASE template1 OWNER TO postgres;

\connect template1

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

--
-- Name: DATABASE template1; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE template1 IS 'default template for new databases';


--
-- Name: template1; Type: DATABASE PROPERTIES; Schema: -; Owner: postgres
--

ALTER DATABASE template1 IS_TEMPLATE = true;


\connect template1

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

--
-- Name: DATABASE template1; Type: ACL; Schema: -; Owner: postgres
--

REVOKE CONNECT,TEMPORARY ON DATABASE template1 FROM PUBLIC;
GRANT CONNECT ON DATABASE template1 TO PUBLIC;


--
-- PostgreSQL database dump complete
--

--
-- Database "postgres" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 12.4 (Debian 12.4-1.pgdg100+1)
-- Dumped by pg_dump version 12.4 (Debian 12.4-1.pgdg100+1)

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

DROP DATABASE postgres;
--
-- Name: postgres; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.utf8' LC_CTYPE = 'en_US.utf8';


ALTER DATABASE postgres OWNER TO postgres;

\connect postgres

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

--
-- Name: DATABASE postgres; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE postgres IS 'default administrative connection database';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: api_favorite; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.api_favorite (
    id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.api_favorite OWNER TO postgres;

--
-- Name: api_favorite_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.api_favorite_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_favorite_id_seq OWNER TO postgres;

--
-- Name: api_favorite_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.api_favorite_id_seq OWNED BY public.api_favorite.id;


--
-- Name: api_favorite_recipe; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.api_favorite_recipe (
    id integer NOT NULL,
    favorite_id integer NOT NULL,
    recipe_id integer NOT NULL
);


ALTER TABLE public.api_favorite_recipe OWNER TO postgres;

--
-- Name: api_favorite_recipe_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.api_favorite_recipe_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_favorite_recipe_id_seq OWNER TO postgres;

--
-- Name: api_favorite_recipe_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.api_favorite_recipe_id_seq OWNED BY public.api_favorite_recipe.id;


--
-- Name: api_follow; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.api_follow (
    id integer NOT NULL,
    author_id integer NOT NULL
);


ALTER TABLE public.api_follow OWNER TO postgres;

--
-- Name: api_follow_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.api_follow_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_follow_id_seq OWNER TO postgres;

--
-- Name: api_follow_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.api_follow_id_seq OWNED BY public.api_follow.id;


--
-- Name: api_follow_subscriber; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.api_follow_subscriber (
    id integer NOT NULL,
    follow_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.api_follow_subscriber OWNER TO postgres;

--
-- Name: api_follow_subscriber_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.api_follow_subscriber_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_follow_subscriber_id_seq OWNER TO postgres;

--
-- Name: api_follow_subscriber_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.api_follow_subscriber_id_seq OWNED BY public.api_follow_subscriber.id;


--
-- Name: api_ingredient; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.api_ingredient (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    measurement_unit character varying(200) NOT NULL
);


ALTER TABLE public.api_ingredient OWNER TO postgres;

--
-- Name: api_ingredient_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.api_ingredient_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_ingredient_id_seq OWNER TO postgres;

--
-- Name: api_ingredient_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.api_ingredient_id_seq OWNED BY public.api_ingredient.id;


--
-- Name: api_ingredientamount; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.api_ingredientamount (
    id integer NOT NULL,
    amount smallint NOT NULL,
    ingredient_id integer NOT NULL,
    recipe_id integer NOT NULL,
    CONSTRAINT api_ingredientamount_amount_check CHECK ((amount >= 0))
);


ALTER TABLE public.api_ingredientamount OWNER TO postgres;

--
-- Name: api_ingredientamount_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.api_ingredientamount_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_ingredientamount_id_seq OWNER TO postgres;

--
-- Name: api_ingredientamount_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.api_ingredientamount_id_seq OWNED BY public.api_ingredientamount.id;


--
-- Name: api_ingredientinrecipe; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.api_ingredientinrecipe (
    id integer NOT NULL,
    recipe_id integer NOT NULL
);


ALTER TABLE public.api_ingredientinrecipe OWNER TO postgres;

--
-- Name: api_ingredientinrecipe_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.api_ingredientinrecipe_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_ingredientinrecipe_id_seq OWNER TO postgres;

--
-- Name: api_ingredientinrecipe_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.api_ingredientinrecipe_id_seq OWNED BY public.api_ingredientinrecipe.id;


--
-- Name: api_ingredientinrecipe_ingredient; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.api_ingredientinrecipe_ingredient (
    id integer NOT NULL,
    ingredientinrecipe_id integer NOT NULL,
    ingredient_id integer NOT NULL
);


ALTER TABLE public.api_ingredientinrecipe_ingredient OWNER TO postgres;

--
-- Name: api_ingredientinrecipe_ingredient_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.api_ingredientinrecipe_ingredient_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_ingredientinrecipe_ingredient_id_seq OWNER TO postgres;

--
-- Name: api_ingredientinrecipe_ingredient_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.api_ingredientinrecipe_ingredient_id_seq OWNED BY public.api_ingredientinrecipe_ingredient.id;


--
-- Name: api_recipe; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.api_recipe (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    image character varying(100) NOT NULL,
    text text NOT NULL,
    cooking_time smallint NOT NULL,
    author_id integer NOT NULL,
    CONSTRAINT api_recipe_cooking_time_check CHECK ((cooking_time >= 0))
);


ALTER TABLE public.api_recipe OWNER TO postgres;

--
-- Name: api_recipe_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.api_recipe_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_recipe_id_seq OWNER TO postgres;

--
-- Name: api_recipe_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.api_recipe_id_seq OWNED BY public.api_recipe.id;


--
-- Name: api_recipe_tags; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.api_recipe_tags (
    id integer NOT NULL,
    recipe_id integer NOT NULL,
    tag_id integer NOT NULL
);


ALTER TABLE public.api_recipe_tags OWNER TO postgres;

--
-- Name: api_recipe_tags_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.api_recipe_tags_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_recipe_tags_id_seq OWNER TO postgres;

--
-- Name: api_recipe_tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.api_recipe_tags_id_seq OWNED BY public.api_recipe_tags.id;


--
-- Name: api_shoppingcart; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.api_shoppingcart (
    id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.api_shoppingcart OWNER TO postgres;

--
-- Name: api_shoppingcart_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.api_shoppingcart_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_shoppingcart_id_seq OWNER TO postgres;

--
-- Name: api_shoppingcart_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.api_shoppingcart_id_seq OWNED BY public.api_shoppingcart.id;


--
-- Name: api_shoppingcart_recipes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.api_shoppingcart_recipes (
    id integer NOT NULL,
    shoppingcart_id integer NOT NULL,
    recipe_id integer NOT NULL
);


ALTER TABLE public.api_shoppingcart_recipes OWNER TO postgres;

--
-- Name: api_shoppingcart_recipes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.api_shoppingcart_recipes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_shoppingcart_recipes_id_seq OWNER TO postgres;

--
-- Name: api_shoppingcart_recipes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.api_shoppingcart_recipes_id_seq OWNED BY public.api_shoppingcart_recipes.id;


--
-- Name: api_tag; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.api_tag (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    color character varying(7),
    slug character varying(200)
);


ALTER TABLE public.api_tag OWNER TO postgres;

--
-- Name: api_tag_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.api_tag_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_tag_id_seq OWNER TO postgres;

--
-- Name: api_tag_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.api_tag_id_seq OWNED BY public.api_tag.id;


--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: authtoken_token; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.authtoken_token (
    key character varying(40) NOT NULL,
    created timestamp with time zone NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.authtoken_token OWNER TO postgres;

--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO postgres;

--
-- Name: users_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(150) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL,
    email character varying(254) NOT NULL
);


ALTER TABLE public.users_user OWNER TO postgres;

--
-- Name: users_user_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.users_user_groups OWNER TO postgres;

--
-- Name: users_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_groups_id_seq OWNER TO postgres;

--
-- Name: users_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_user_groups_id_seq OWNED BY public.users_user_groups.id;


--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO postgres;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users_user.id;


--
-- Name: users_user_user_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.users_user_user_permissions OWNER TO postgres;

--
-- Name: users_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_user_permissions_id_seq OWNER TO postgres;

--
-- Name: users_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_user_user_permissions_id_seq OWNED BY public.users_user_user_permissions.id;


--
-- Name: api_favorite id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_favorite ALTER COLUMN id SET DEFAULT nextval('public.api_favorite_id_seq'::regclass);


--
-- Name: api_favorite_recipe id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_favorite_recipe ALTER COLUMN id SET DEFAULT nextval('public.api_favorite_recipe_id_seq'::regclass);


--
-- Name: api_follow id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_follow ALTER COLUMN id SET DEFAULT nextval('public.api_follow_id_seq'::regclass);


--
-- Name: api_follow_subscriber id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_follow_subscriber ALTER COLUMN id SET DEFAULT nextval('public.api_follow_subscriber_id_seq'::regclass);


--
-- Name: api_ingredient id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_ingredient ALTER COLUMN id SET DEFAULT nextval('public.api_ingredient_id_seq'::regclass);


--
-- Name: api_ingredientamount id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_ingredientamount ALTER COLUMN id SET DEFAULT nextval('public.api_ingredientamount_id_seq'::regclass);


--
-- Name: api_ingredientinrecipe id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_ingredientinrecipe ALTER COLUMN id SET DEFAULT nextval('public.api_ingredientinrecipe_id_seq'::regclass);


--
-- Name: api_ingredientinrecipe_ingredient id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_ingredientinrecipe_ingredient ALTER COLUMN id SET DEFAULT nextval('public.api_ingredientinrecipe_ingredient_id_seq'::regclass);


--
-- Name: api_recipe id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_recipe ALTER COLUMN id SET DEFAULT nextval('public.api_recipe_id_seq'::regclass);


--
-- Name: api_recipe_tags id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_recipe_tags ALTER COLUMN id SET DEFAULT nextval('public.api_recipe_tags_id_seq'::regclass);


--
-- Name: api_shoppingcart id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_shoppingcart ALTER COLUMN id SET DEFAULT nextval('public.api_shoppingcart_id_seq'::regclass);


--
-- Name: api_shoppingcart_recipes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_shoppingcart_recipes ALTER COLUMN id SET DEFAULT nextval('public.api_shoppingcart_recipes_id_seq'::regclass);


--
-- Name: api_tag id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_tag ALTER COLUMN id SET DEFAULT nextval('public.api_tag_id_seq'::regclass);


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: users_user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_user ALTER COLUMN id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Name: users_user_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_user_groups ALTER COLUMN id SET DEFAULT nextval('public.users_user_groups_id_seq'::regclass);


--
-- Name: users_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.users_user_user_permissions_id_seq'::regclass);


--
-- Data for Name: api_favorite; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.api_favorite (id, user_id) FROM stdin;
\.


--
-- Data for Name: api_favorite_recipe; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.api_favorite_recipe (id, favorite_id, recipe_id) FROM stdin;
\.


--
-- Data for Name: api_follow; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.api_follow (id, author_id) FROM stdin;
\.


--
-- Data for Name: api_follow_subscriber; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.api_follow_subscriber (id, follow_id, user_id) FROM stdin;
\.


--
-- Data for Name: api_ingredient; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.api_ingredient (id, name, measurement_unit) FROM stdin;
\.


--
-- Data for Name: api_ingredientamount; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.api_ingredientamount (id, amount, ingredient_id, recipe_id) FROM stdin;
\.


--
-- Data for Name: api_ingredientinrecipe; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.api_ingredientinrecipe (id, recipe_id) FROM stdin;
\.


--
-- Data for Name: api_ingredientinrecipe_ingredient; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.api_ingredientinrecipe_ingredient (id, ingredientinrecipe_id, ingredient_id) FROM stdin;
\.


--
-- Data for Name: api_recipe; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.api_recipe (id, name, image, text, cooking_time, author_id) FROM stdin;
\.


--
-- Data for Name: api_recipe_tags; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.api_recipe_tags (id, recipe_id, tag_id) FROM stdin;
\.


--
-- Data for Name: api_shoppingcart; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.api_shoppingcart (id, user_id) FROM stdin;
\.


--
-- Data for Name: api_shoppingcart_recipes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.api_shoppingcart_recipes (id, shoppingcart_id, recipe_id) FROM stdin;
\.


--
-- Data for Name: api_tag; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.api_tag (id, name, color, slug) FROM stdin;
\.


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add content type	4	add_contenttype
14	Can change content type	4	change_contenttype
15	Can delete content type	4	delete_contenttype
16	Can view content type	4	view_contenttype
17	Can add session	5	add_session
18	Can change session	5	change_session
19	Can delete session	5	delete_session
20	Can view session	5	view_session
21	Can add favorite	6	add_favorite
22	Can change favorite	6	change_favorite
23	Can delete favorite	6	delete_favorite
24	Can view favorite	6	view_favorite
25	Can add follow	7	add_follow
26	Can change follow	7	change_follow
27	Can delete follow	7	delete_follow
28	Can view follow	7	view_follow
29	Can add Ингредиент	8	add_ingredient
30	Can change Ингредиент	8	change_ingredient
31	Can delete Ингредиент	8	delete_ingredient
32	Can view Ингредиент	8	view_ingredient
33	Can add Количество ингредиента	9	add_ingredientamount
34	Can change Количество ингредиента	9	change_ingredientamount
35	Can delete Количество ингредиента	9	delete_ingredientamount
36	Can view Количество ингредиента	9	view_ingredientamount
37	Can add ingredient in recipe	10	add_ingredientinrecipe
38	Can change ingredient in recipe	10	change_ingredientinrecipe
39	Can delete ingredient in recipe	10	delete_ingredientinrecipe
40	Can view ingredient in recipe	10	view_ingredientinrecipe
41	Can add Рецепт	11	add_recipe
42	Can change Рецепт	11	change_recipe
43	Can delete Рецепт	11	delete_recipe
44	Can view Рецепт	11	view_recipe
45	Can add Тег	12	add_tag
46	Can change Тег	12	change_tag
47	Can delete Тег	12	delete_tag
48	Can view Тег	12	view_tag
49	Can add shopping cart	13	add_shoppingcart
50	Can change shopping cart	13	change_shoppingcart
51	Can delete shopping cart	13	delete_shoppingcart
52	Can view shopping cart	13	view_shoppingcart
53	Can add Token	14	add_token
54	Can change Token	14	change_token
55	Can delete Token	14	delete_token
56	Can view Token	14	view_token
57	Can add Пользователь	15	add_user
58	Can change Пользователь	15	change_user
59	Can delete Пользователь	15	delete_user
60	Can view Пользователь	15	view_user
\.


--
-- Data for Name: authtoken_token; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.authtoken_token (key, created, user_id) FROM stdin;
d2ac2342496b946d79e7147050a0552fcef38a29	2021-11-18 10:29:35.645139+00	1
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	contenttypes	contenttype
5	sessions	session
6	api	favorite
7	api	follow
8	api	ingredient
9	api	ingredientamount
10	api	ingredientinrecipe
11	api	recipe
12	api	tag
13	api	shoppingcart
14	authtoken	token
15	users	user
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2021-11-18 10:27:58.158618+00
2	contenttypes	0002_remove_content_type_name	2021-11-18 10:27:58.172375+00
3	auth	0001_initial	2021-11-18 10:27:58.21865+00
4	auth	0002_alter_permission_name_max_length	2021-11-18 10:27:58.267314+00
5	auth	0003_alter_user_email_max_length	2021-11-18 10:27:58.277324+00
6	auth	0004_alter_user_username_opts	2021-11-18 10:27:58.288424+00
7	auth	0005_alter_user_last_login_null	2021-11-18 10:27:58.299416+00
8	auth	0006_require_contenttypes_0002	2021-11-18 10:27:58.304934+00
9	auth	0007_alter_validators_add_error_messages	2021-11-18 10:27:58.315456+00
10	auth	0008_alter_user_username_max_length	2021-11-18 10:27:58.326129+00
11	auth	0009_alter_user_last_name_max_length	2021-11-18 10:27:58.336122+00
12	auth	0010_alter_group_name_max_length	2021-11-18 10:27:58.347926+00
13	auth	0011_update_proxy_permissions	2021-11-18 10:27:58.358547+00
14	users	0001_initial	2021-11-18 10:27:58.410304+00
15	admin	0001_initial	2021-11-18 10:27:58.500119+00
16	admin	0002_logentry_remove_auto_add	2021-11-18 10:27:58.52766+00
17	admin	0003_logentry_add_action_flag_choices	2021-11-18 10:27:58.543954+00
18	api	0001_initial	2021-11-18 10:27:58.661021+00
19	api	0002_auto_20211118_1027	2021-11-18 10:27:58.901049+00
20	authtoken	0001_initial	2021-11-18 10:27:59.071034+00
21	authtoken	0002_auto_20160226_1747	2021-11-18 10:27:59.147728+00
22	sessions	0001_initial	2021-11-18 10:27:59.170684+00
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
xkbawv44kzci8osl1tu2dgyljtidxtb3	NzUxMjgxODFmODdhMTBiNGUyOTViYThmOGUwNjM0NDE0NDMyY2M2MTp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI1MGY5MzQxMjRhYjhmYzY4YjUwZGQyZTQ3MmI5ZWJmNTc5ODg3MmIwIn0=	2021-12-02 19:39:03.173698+00
\.


--
-- Data for Name: users_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users_user (id, password, last_login, is_superuser, username, first_name, last_name, is_staff, is_active, date_joined, email) FROM stdin;
1	pbkdf2_sha256$180000$3xKsoYwvV5Xe$NKoPLwRGwX1c6sLkv8zbqljO10F0fELWdCPJeo3ouBg=	2021-11-18 10:29:35.657995+00	f	user11			f	t	2021-11-18 10:29:22.18344+00	user11@yandex.ru
2	pbkdf2_sha256$180000$X16Mi1shG1I0$V06K25GnM+dUAPaecrBRxl7uIo6sihywlpoVohIKhaE=	2021-11-18 19:39:03.167964+00	t	admin1			t	t	2021-11-18 19:38:56.360781+00	admin1@yandex.ru
\.


--
-- Data for Name: users_user_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: users_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Name: api_favorite_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.api_favorite_id_seq', 1, false);


--
-- Name: api_favorite_recipe_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.api_favorite_recipe_id_seq', 1, false);


--
-- Name: api_follow_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.api_follow_id_seq', 1, false);


--
-- Name: api_follow_subscriber_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.api_follow_subscriber_id_seq', 1, false);


--
-- Name: api_ingredient_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.api_ingredient_id_seq', 1, false);


--
-- Name: api_ingredientamount_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.api_ingredientamount_id_seq', 1, false);


--
-- Name: api_ingredientinrecipe_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.api_ingredientinrecipe_id_seq', 1, false);


--
-- Name: api_ingredientinrecipe_ingredient_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.api_ingredientinrecipe_ingredient_id_seq', 1, false);


--
-- Name: api_recipe_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.api_recipe_id_seq', 1, false);


--
-- Name: api_recipe_tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.api_recipe_tags_id_seq', 1, false);


--
-- Name: api_shoppingcart_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.api_shoppingcart_id_seq', 1, false);


--
-- Name: api_shoppingcart_recipes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.api_shoppingcart_recipes_id_seq', 1, false);


--
-- Name: api_tag_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.api_tag_id_seq', 1, false);


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 60, true);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, false);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 15, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 22, true);


--
-- Name: users_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_user_groups_id_seq', 1, false);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_user_id_seq', 2, true);


--
-- Name: users_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_user_user_permissions_id_seq', 1, false);


--
-- Name: api_favorite api_favorite_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_favorite
    ADD CONSTRAINT api_favorite_pkey PRIMARY KEY (id);


--
-- Name: api_favorite_recipe api_favorite_recipe_favorite_id_recipe_id_cb977ac3_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_favorite_recipe
    ADD CONSTRAINT api_favorite_recipe_favorite_id_recipe_id_cb977ac3_uniq UNIQUE (favorite_id, recipe_id);


--
-- Name: api_favorite_recipe api_favorite_recipe_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_favorite_recipe
    ADD CONSTRAINT api_favorite_recipe_pkey PRIMARY KEY (id);


--
-- Name: api_follow api_follow_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_follow
    ADD CONSTRAINT api_follow_pkey PRIMARY KEY (id);


--
-- Name: api_follow_subscriber api_follow_subscriber_follow_id_user_id_35e38e9e_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_follow_subscriber
    ADD CONSTRAINT api_follow_subscriber_follow_id_user_id_35e38e9e_uniq UNIQUE (follow_id, user_id);


--
-- Name: api_follow_subscriber api_follow_subscriber_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_follow_subscriber
    ADD CONSTRAINT api_follow_subscriber_pkey PRIMARY KEY (id);


--
-- Name: api_ingredient api_ingredient_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_ingredient
    ADD CONSTRAINT api_ingredient_name_key UNIQUE (name);


--
-- Name: api_ingredient api_ingredient_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_ingredient
    ADD CONSTRAINT api_ingredient_pkey PRIMARY KEY (id);


--
-- Name: api_ingredientamount api_ingredientamount_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_ingredientamount
    ADD CONSTRAINT api_ingredientamount_pkey PRIMARY KEY (id);


--
-- Name: api_ingredientinrecipe_ingredient api_ingredientinrecipe_i_ingredientinrecipe_id_in_ae559c7c_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_ingredientinrecipe_ingredient
    ADD CONSTRAINT api_ingredientinrecipe_i_ingredientinrecipe_id_in_ae559c7c_uniq UNIQUE (ingredientinrecipe_id, ingredient_id);


--
-- Name: api_ingredientinrecipe_ingredient api_ingredientinrecipe_ingredient_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_ingredientinrecipe_ingredient
    ADD CONSTRAINT api_ingredientinrecipe_ingredient_pkey PRIMARY KEY (id);


--
-- Name: api_ingredientinrecipe api_ingredientinrecipe_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_ingredientinrecipe
    ADD CONSTRAINT api_ingredientinrecipe_pkey PRIMARY KEY (id);


--
-- Name: api_recipe api_recipe_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_recipe
    ADD CONSTRAINT api_recipe_name_key UNIQUE (name);


--
-- Name: api_recipe api_recipe_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_recipe
    ADD CONSTRAINT api_recipe_pkey PRIMARY KEY (id);


--
-- Name: api_recipe_tags api_recipe_tags_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_recipe_tags
    ADD CONSTRAINT api_recipe_tags_pkey PRIMARY KEY (id);


--
-- Name: api_recipe_tags api_recipe_tags_recipe_id_tag_id_4e3605b4_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_recipe_tags
    ADD CONSTRAINT api_recipe_tags_recipe_id_tag_id_4e3605b4_uniq UNIQUE (recipe_id, tag_id);


--
-- Name: api_shoppingcart api_shoppingcart_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_shoppingcart
    ADD CONSTRAINT api_shoppingcart_pkey PRIMARY KEY (id);


--
-- Name: api_shoppingcart_recipes api_shoppingcart_recipes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_shoppingcart_recipes
    ADD CONSTRAINT api_shoppingcart_recipes_pkey PRIMARY KEY (id);


--
-- Name: api_shoppingcart_recipes api_shoppingcart_recipes_shoppingcart_id_recipe_i_87af5761_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_shoppingcart_recipes
    ADD CONSTRAINT api_shoppingcart_recipes_shoppingcart_id_recipe_i_87af5761_uniq UNIQUE (shoppingcart_id, recipe_id);


--
-- Name: api_tag api_tag_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_tag
    ADD CONSTRAINT api_tag_pkey PRIMARY KEY (id);


--
-- Name: api_tag api_tag_slug_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_tag
    ADD CONSTRAINT api_tag_slug_key UNIQUE (slug);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: authtoken_token authtoken_token_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_pkey PRIMARY KEY (key);


--
-- Name: authtoken_token authtoken_token_user_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_key UNIQUE (user_id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: users_user users_user_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_user
    ADD CONSTRAINT users_user_email_key UNIQUE (email);


--
-- Name: users_user_groups users_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_user_groups
    ADD CONSTRAINT users_user_groups_pkey PRIMARY KEY (id);


--
-- Name: users_user_groups users_user_groups_user_id_group_id_b88eab82_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_user_groups
    ADD CONSTRAINT users_user_groups_user_id_group_id_b88eab82_uniq UNIQUE (user_id, group_id);


--
-- Name: users_user users_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_user
    ADD CONSTRAINT users_user_pkey PRIMARY KEY (id);


--
-- Name: users_user_user_permissions users_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_user_user_permissions
    ADD CONSTRAINT users_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: users_user_user_permissions users_user_user_permissions_user_id_permission_id_43338c45_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_user_user_permissions
    ADD CONSTRAINT users_user_user_permissions_user_id_permission_id_43338c45_uniq UNIQUE (user_id, permission_id);


--
-- Name: users_user users_user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_user
    ADD CONSTRAINT users_user_username_key UNIQUE (username);


--
-- Name: api_favorite_recipe_favorite_id_6dd16ab1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX api_favorite_recipe_favorite_id_6dd16ab1 ON public.api_favorite_recipe USING btree (favorite_id);


--
-- Name: api_favorite_recipe_recipe_id_7a1a0034; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX api_favorite_recipe_recipe_id_7a1a0034 ON public.api_favorite_recipe USING btree (recipe_id);


--
-- Name: api_favorite_user_id_87b96550; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX api_favorite_user_id_87b96550 ON public.api_favorite USING btree (user_id);


--
-- Name: api_follow_author_id_edf7eb6e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX api_follow_author_id_edf7eb6e ON public.api_follow USING btree (author_id);


--
-- Name: api_follow_subscriber_follow_id_05d7010b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX api_follow_subscriber_follow_id_05d7010b ON public.api_follow_subscriber USING btree (follow_id);


--
-- Name: api_follow_subscriber_user_id_b43a4a71; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX api_follow_subscriber_user_id_b43a4a71 ON public.api_follow_subscriber USING btree (user_id);


--
-- Name: api_ingredient_name_fd445561_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX api_ingredient_name_fd445561_like ON public.api_ingredient USING btree (name varchar_pattern_ops);


--
-- Name: api_ingredientamount_ingredient_id_f237421e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX api_ingredientamount_ingredient_id_f237421e ON public.api_ingredientamount USING btree (ingredient_id);


--
-- Name: api_ingredientamount_recipe_id_c83fd8d0; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX api_ingredientamount_recipe_id_c83fd8d0 ON public.api_ingredientamount USING btree (recipe_id);


--
-- Name: api_ingredientinrecipe_ing_ingredientinrecipe_id_00092026; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX api_ingredientinrecipe_ing_ingredientinrecipe_id_00092026 ON public.api_ingredientinrecipe_ingredient USING btree (ingredientinrecipe_id);


--
-- Name: api_ingredientinrecipe_ingredient_ingredient_id_a91af5a9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX api_ingredientinrecipe_ingredient_ingredient_id_a91af5a9 ON public.api_ingredientinrecipe_ingredient USING btree (ingredient_id);


--
-- Name: api_ingredientinrecipe_recipe_id_4e0f91e1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX api_ingredientinrecipe_recipe_id_4e0f91e1 ON public.api_ingredientinrecipe USING btree (recipe_id);


--
-- Name: api_recipe_author_id_423d4c07; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX api_recipe_author_id_423d4c07 ON public.api_recipe USING btree (author_id);


--
-- Name: api_recipe_name_bf8e9fa4_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX api_recipe_name_bf8e9fa4_like ON public.api_recipe USING btree (name varchar_pattern_ops);


--
-- Name: api_recipe_tags_recipe_id_39cc25a8; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX api_recipe_tags_recipe_id_39cc25a8 ON public.api_recipe_tags USING btree (recipe_id);


--
-- Name: api_recipe_tags_tag_id_85673ca0; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX api_recipe_tags_tag_id_85673ca0 ON public.api_recipe_tags USING btree (tag_id);


--
-- Name: api_shoppingcart_recipes_recipe_id_209ad72a; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX api_shoppingcart_recipes_recipe_id_209ad72a ON public.api_shoppingcart_recipes USING btree (recipe_id);


--
-- Name: api_shoppingcart_recipes_shoppingcart_id_7e493b58; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX api_shoppingcart_recipes_shoppingcart_id_7e493b58 ON public.api_shoppingcart_recipes USING btree (shoppingcart_id);


--
-- Name: api_shoppingcart_user_id_5f57095c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX api_shoppingcart_user_id_5f57095c ON public.api_shoppingcart USING btree (user_id);


--
-- Name: api_tag_slug_dc7250ca_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX api_tag_slug_dc7250ca_like ON public.api_tag USING btree (slug varchar_pattern_ops);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: authtoken_token_key_10f0b77e_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX authtoken_token_key_10f0b77e_like ON public.authtoken_token USING btree (key varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: users_user_email_243f6e77_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX users_user_email_243f6e77_like ON public.users_user USING btree (email varchar_pattern_ops);


--
-- Name: users_user_groups_group_id_9afc8d0e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX users_user_groups_group_id_9afc8d0e ON public.users_user_groups USING btree (group_id);


--
-- Name: users_user_groups_user_id_5f6f5a90; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX users_user_groups_user_id_5f6f5a90 ON public.users_user_groups USING btree (user_id);


--
-- Name: users_user_user_permissions_permission_id_0b93982e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX users_user_user_permissions_permission_id_0b93982e ON public.users_user_user_permissions USING btree (permission_id);


--
-- Name: users_user_user_permissions_user_id_20aca447; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX users_user_user_permissions_user_id_20aca447 ON public.users_user_user_permissions USING btree (user_id);


--
-- Name: users_user_username_06e46fe6_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX users_user_username_06e46fe6_like ON public.users_user USING btree (username varchar_pattern_ops);


--
-- Name: api_favorite_recipe api_favorite_recipe_favorite_id_6dd16ab1_fk_api_favorite_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_favorite_recipe
    ADD CONSTRAINT api_favorite_recipe_favorite_id_6dd16ab1_fk_api_favorite_id FOREIGN KEY (favorite_id) REFERENCES public.api_favorite(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_favorite_recipe api_favorite_recipe_recipe_id_7a1a0034_fk_api_recipe_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_favorite_recipe
    ADD CONSTRAINT api_favorite_recipe_recipe_id_7a1a0034_fk_api_recipe_id FOREIGN KEY (recipe_id) REFERENCES public.api_recipe(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_favorite api_favorite_user_id_87b96550_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_favorite
    ADD CONSTRAINT api_favorite_user_id_87b96550_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_follow api_follow_author_id_edf7eb6e_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_follow
    ADD CONSTRAINT api_follow_author_id_edf7eb6e_fk_users_user_id FOREIGN KEY (author_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_follow_subscriber api_follow_subscriber_follow_id_05d7010b_fk_api_follow_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_follow_subscriber
    ADD CONSTRAINT api_follow_subscriber_follow_id_05d7010b_fk_api_follow_id FOREIGN KEY (follow_id) REFERENCES public.api_follow(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_follow_subscriber api_follow_subscriber_user_id_b43a4a71_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_follow_subscriber
    ADD CONSTRAINT api_follow_subscriber_user_id_b43a4a71_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_ingredientamount api_ingredientamount_ingredient_id_f237421e_fk_api_ingre; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_ingredientamount
    ADD CONSTRAINT api_ingredientamount_ingredient_id_f237421e_fk_api_ingre FOREIGN KEY (ingredient_id) REFERENCES public.api_ingredient(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_ingredientamount api_ingredientamount_recipe_id_c83fd8d0_fk_api_recipe_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_ingredientamount
    ADD CONSTRAINT api_ingredientamount_recipe_id_c83fd8d0_fk_api_recipe_id FOREIGN KEY (recipe_id) REFERENCES public.api_recipe(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_ingredientinrecipe_ingredient api_ingredientinreci_ingredient_id_a91af5a9_fk_api_ingre; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_ingredientinrecipe_ingredient
    ADD CONSTRAINT api_ingredientinreci_ingredient_id_a91af5a9_fk_api_ingre FOREIGN KEY (ingredient_id) REFERENCES public.api_ingredient(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_ingredientinrecipe_ingredient api_ingredientinreci_ingredientinrecipe_i_00092026_fk_api_ingre; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_ingredientinrecipe_ingredient
    ADD CONSTRAINT api_ingredientinreci_ingredientinrecipe_i_00092026_fk_api_ingre FOREIGN KEY (ingredientinrecipe_id) REFERENCES public.api_ingredientinrecipe(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_ingredientinrecipe api_ingredientinrecipe_recipe_id_4e0f91e1_fk_api_recipe_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_ingredientinrecipe
    ADD CONSTRAINT api_ingredientinrecipe_recipe_id_4e0f91e1_fk_api_recipe_id FOREIGN KEY (recipe_id) REFERENCES public.api_recipe(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_recipe api_recipe_author_id_423d4c07_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_recipe
    ADD CONSTRAINT api_recipe_author_id_423d4c07_fk_users_user_id FOREIGN KEY (author_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_recipe_tags api_recipe_tags_recipe_id_39cc25a8_fk_api_recipe_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_recipe_tags
    ADD CONSTRAINT api_recipe_tags_recipe_id_39cc25a8_fk_api_recipe_id FOREIGN KEY (recipe_id) REFERENCES public.api_recipe(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_recipe_tags api_recipe_tags_tag_id_85673ca0_fk_api_tag_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_recipe_tags
    ADD CONSTRAINT api_recipe_tags_tag_id_85673ca0_fk_api_tag_id FOREIGN KEY (tag_id) REFERENCES public.api_tag(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_shoppingcart_recipes api_shoppingcart_rec_shoppingcart_id_7e493b58_fk_api_shopp; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_shoppingcart_recipes
    ADD CONSTRAINT api_shoppingcart_rec_shoppingcart_id_7e493b58_fk_api_shopp FOREIGN KEY (shoppingcart_id) REFERENCES public.api_shoppingcart(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_shoppingcart_recipes api_shoppingcart_recipes_recipe_id_209ad72a_fk_api_recipe_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_shoppingcart_recipes
    ADD CONSTRAINT api_shoppingcart_recipes_recipe_id_209ad72a_fk_api_recipe_id FOREIGN KEY (recipe_id) REFERENCES public.api_recipe(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_shoppingcart api_shoppingcart_user_id_5f57095c_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_shoppingcart
    ADD CONSTRAINT api_shoppingcart_user_id_5f57095c_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: authtoken_token authtoken_token_user_id_35299eff_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_35299eff_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_user_groups users_user_groups_group_id_9afc8d0e_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_user_groups
    ADD CONSTRAINT users_user_groups_group_id_9afc8d0e_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_user_groups users_user_groups_user_id_5f6f5a90_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_user_groups
    ADD CONSTRAINT users_user_groups_user_id_5f6f5a90_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_user_user_permissions users_user_user_perm_permission_id_0b93982e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_user_user_permissions
    ADD CONSTRAINT users_user_user_perm_permission_id_0b93982e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_user_user_permissions users_user_user_permissions_user_id_20aca447_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_user_user_permissions
    ADD CONSTRAINT users_user_user_permissions_user_id_20aca447_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database cluster dump complete
--

