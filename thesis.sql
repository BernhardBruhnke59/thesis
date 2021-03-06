PGDMP     
    .                t           postgres    9.5.2    9.5.1 #    V           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            W           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            X           1262    12373    postgres    DATABASE     �   CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'English_United States.1252' LC_CTYPE = 'English_United States.1252';
    DROP DATABASE postgres;
             postgres    false            Y           1262    12373    postgres    COMMENT     N   COMMENT ON DATABASE postgres IS 'default administrative connection database';
                  postgres    false    2136                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
             postgres    false            Z           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                  postgres    false    7            [           0    0    public    ACL     �   REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;
                  postgres    false    7                        3079    12355    plpgsql 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;
    DROP EXTENSION plpgsql;
                  false            \           0    0    EXTENSION plpgsql    COMMENT     @   COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';
                       false    2                        3079    16384 	   adminpack 	   EXTENSION     A   CREATE EXTENSION IF NOT EXISTS adminpack WITH SCHEMA pg_catalog;
    DROP EXTENSION adminpack;
                  false            ]           0    0    EXTENSION adminpack    COMMENT     M   COMMENT ON EXTENSION adminpack IS 'administrative functions for PostgreSQL';
                       false    1            �            1259    16517    chatroom    TABLE       CREATE TABLE chatroom (
    id integer NOT NULL,
    "idChatroom" character varying(255) NOT NULL,
    message character varying(255) NOT NULL,
    "idSender" integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
    DROP TABLE public.chatroom;
       public         postgres    false    7            �            1259    16515    chatroom_id_seq    SEQUENCE     q   CREATE SEQUENCE chatroom_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.chatroom_id_seq;
       public       postgres    false    188    7            ^           0    0    chatroom_id_seq    SEQUENCE OWNED BY     5   ALTER SEQUENCE chatroom_id_seq OWNED BY chatroom.id;
            public       postgres    false    187            �            1259    16485    credentials    TABLE     f   CREATE TABLE credentials (
    "idUser" integer NOT NULL,
    hash character varying(255) NOT NULL
);
    DROP TABLE public.credentials;
       public         postgres    false    7            �            1259    16468    user    TABLE       CREATE TABLE "user" (
    id integer NOT NULL,
    "nameLast" character varying(255) NOT NULL,
    "nameFirst" character varying(255) NOT NULL,
    email character(255),
    "desc" character(255),
    img character(255),
    username character(45) NOT NULL
);
    DROP TABLE public."user";
       public         postgres    false    7            �            1259    16509    userChatroomJct    TABLE     �   CREATE TABLE "userChatroomJct" (
    id integer NOT NULL,
    "idUser" integer NOT NULL,
    "idChatroom" character varying(255) NOT NULL
);
 %   DROP TABLE public."userChatroomJct";
       public         postgres    false    7            �            1259    16507    userChatroomJct_id_seq    SEQUENCE     z   CREATE SEQUENCE "userChatroomJct_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public."userChatroomJct_id_seq";
       public       postgres    false    7    186            _           0    0    userChatroomJct_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE "userChatroomJct_id_seq" OWNED BY "userChatroomJct".id;
            public       postgres    false    185            �            1259    16466    user_id_seq    SEQUENCE     m   CREATE SEQUENCE user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.user_id_seq;
       public       postgres    false    7    183            `           0    0    user_id_seq    SEQUENCE OWNED BY     /   ALTER SEQUENCE user_id_seq OWNED BY "user".id;
            public       postgres    false    182            �           2604    16520    id    DEFAULT     \   ALTER TABLE ONLY chatroom ALTER COLUMN id SET DEFAULT nextval('chatroom_id_seq'::regclass);
 :   ALTER TABLE public.chatroom ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    187    188    188            �           2604    16471    id    DEFAULT     V   ALTER TABLE ONLY "user" ALTER COLUMN id SET DEFAULT nextval('user_id_seq'::regclass);
 8   ALTER TABLE public."user" ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    182    183    183            �           2604    16512    id    DEFAULT     n   ALTER TABLE ONLY "userChatroomJct" ALTER COLUMN id SET DEFAULT nextval('"userChatroomJct_id_seq"'::regclass);
 C   ALTER TABLE public."userChatroomJct" ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    185    186    186            S          0    16517    chatroom 
   TABLE DATA               \   COPY chatroom (id, "idChatroom", message, "idSender", "createdAt", "updatedAt") FROM stdin;
    public       postgres    false    188   V"       a           0    0    chatroom_id_seq    SEQUENCE SET     6   SELECT pg_catalog.setval('chatroom_id_seq', 2, true);
            public       postgres    false    187            O          0    16485    credentials 
   TABLE DATA               .   COPY credentials ("idUser", hash) FROM stdin;
    public       postgres    false    184   �"       N          0    16468    user 
   TABLE DATA               T   COPY "user" (id, "nameLast", "nameFirst", email, "desc", img, username) FROM stdin;
    public       postgres    false    183   #       Q          0    16509    userChatroomJct 
   TABLE DATA               @   COPY "userChatroomJct" (id, "idUser", "idChatroom") FROM stdin;
    public       postgres    false    186   �#       b           0    0    userChatroomJct_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('"userChatroomJct_id_seq"', 1, true);
            public       postgres    false    185            c           0    0    user_id_seq    SEQUENCE SET     2   SELECT pg_catalog.setval('user_id_seq', 1, true);
            public       postgres    false    182            �           2606    16525    chatroom_pkey 
   CONSTRAINT     M   ALTER TABLE ONLY chatroom
    ADD CONSTRAINT chatroom_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.chatroom DROP CONSTRAINT chatroom_pkey;
       public         postgres    false    188    188            �           2606    16489    credentials_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY credentials
    ADD CONSTRAINT credentials_pkey PRIMARY KEY ("idUser");
 F   ALTER TABLE ONLY public.credentials DROP CONSTRAINT credentials_pkey;
       public         postgres    false    184    184            �           2606    16514    userChatroomJct_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY "userChatroomJct"
    ADD CONSTRAINT "userChatroomJct_pkey" PRIMARY KEY (id);
 R   ALTER TABLE ONLY public."userChatroomJct" DROP CONSTRAINT "userChatroomJct_pkey";
       public         postgres    false    186    186            �           2606    16476 	   user_pkey 
   CONSTRAINT     G   ALTER TABLE ONLY "user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public."user" DROP CONSTRAINT user_pkey;
       public         postgres    false    183    183            S   [   x�}�1� @ѹ=�����peup�������~�tW�+�(I[��L�hg!N��qXX���⅋���P��똪�g���.�<"�}�&�      O   L   x�3�T1JT14P	7��.6��(�Mw�/M�H���,�L�5ɲH+p-M�+�2.M.0	�*7��K�0����� ���      N   �   x�3��NM�I���J��L������9�e�z���
#	p�dd+ Qn�BJjq�@��ހ3�����J_�X/�(�,�$���!L}����DC�CKsCS3�4�d�D��dCKS�b[#��� ���Q����� ���      Q   *   x�3�4�4I2I5�00J�43I452HIKM52K5����� ���     