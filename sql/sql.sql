PGDMP     $                    {           candidatura    15.2    15.2     #           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            $           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            %           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            &           1262    16399    candidatura    DATABASE     ~   CREATE DATABASE candidatura WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Chile.1252';
    DROP DATABASE candidatura;
                postgres    false            �            1259    16417 	   candidato    TABLE     K   CREATE TABLE public.candidato (
    id bigint NOT NULL,
    nombre text
);
    DROP TABLE public.candidato;
       public         heap    postgres    false            �            1259    16424    comuna    TABLE     g   CREATE TABLE public.comuna (
    id bigint NOT NULL,
    nombre text NOT NULL,
    region_id bigint
);
    DROP TABLE public.comuna;
       public         heap    postgres    false            �            1259    16438    encuesta    TABLE     S   CREATE TABLE public.encuesta (
    id bigint NOT NULL,
    nombre text NOT NULL
);
    DROP TABLE public.encuesta;
       public         heap    postgres    false            �            1259    16445    encuesta_votante    TABLE     p   CREATE TABLE public.encuesta_votante (
    id bigint NOT NULL,
    votante_id bigint,
    encuesta_id bigint
);
 $   DROP TABLE public.encuesta_votante;
       public         heap    postgres    false            �            1259    16476    encuesta_votante_id_seq    SEQUENCE     �   ALTER TABLE public.encuesta_votante ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.encuesta_votante_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 100
    CACHE 1
);
            public          postgres    false    219            �            1259    16431    region    TABLE     Q   CREATE TABLE public.region (
    id bigint NOT NULL,
    nombre text NOT NULL
);
    DROP TABLE public.region;
       public         heap    postgres    false            �            1259    16405    votante    TABLE     �   CREATE TABLE public.votante (
    id bigint NOT NULL,
    nombre text NOT NULL,
    apellido text NOT NULL,
    alias text NOT NULL,
    email text NOT NULL,
    comuna_id bigint NOT NULL,
    candidato_id bigint NOT NULL,
    rut text NOT NULL
);
    DROP TABLE public.votante;
       public         heap    postgres    false            �            1259    16475    votante_id_seq    SEQUENCE     �   ALTER TABLE public.votante ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.votante_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 100
    CACHE 1
);
            public          postgres    false    214                      0    16417 	   candidato 
   TABLE DATA           /   COPY public.candidato (id, nombre) FROM stdin;
    public          postgres    false    215   w!                 0    16424    comuna 
   TABLE DATA           7   COPY public.comuna (id, nombre, region_id) FROM stdin;
    public          postgres    false    216   �!                 0    16438    encuesta 
   TABLE DATA           .   COPY public.encuesta (id, nombre) FROM stdin;
    public          postgres    false    218   �'                 0    16445    encuesta_votante 
   TABLE DATA           G   COPY public.encuesta_votante (id, votante_id, encuesta_id) FROM stdin;
    public          postgres    false    219   �'                 0    16431    region 
   TABLE DATA           ,   COPY public.region (id, nombre) FROM stdin;
    public          postgres    false    217   (                 0    16405    votante 
   TABLE DATA           c   COPY public.votante (id, nombre, apellido, alias, email, comuna_id, candidato_id, rut) FROM stdin;
    public          postgres    false    214   �(       '           0    0    encuesta_votante_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.encuesta_votante_id_seq', 4, true);
          public          postgres    false    221            (           0    0    votante_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.votante_id_seq', 6, true);
          public          postgres    false    220                       2606    16430    comuna comuna_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.comuna
    ADD CONSTRAINT comuna_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.comuna DROP CONSTRAINT comuna_pkey;
       public            postgres    false    216            �           2606    16449 $   encuesta_votante encuesta_votante_id 
   CONSTRAINT     b   ALTER TABLE ONLY public.encuesta_votante
    ADD CONSTRAINT encuesta_votante_id PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.encuesta_votante DROP CONSTRAINT encuesta_votante_id;
       public            postgres    false    219            }           2606    16423    candidato id_candidato 
   CONSTRAINT     T   ALTER TABLE ONLY public.candidato
    ADD CONSTRAINT id_candidato PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.candidato DROP CONSTRAINT id_candidato;
       public            postgres    false    215            �           2606    16444    encuesta id_encuesta 
   CONSTRAINT     R   ALTER TABLE ONLY public.encuesta
    ADD CONSTRAINT id_encuesta PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.encuesta DROP CONSTRAINT id_encuesta;
       public            postgres    false    218            �           2606    16437    region id_region 
   CONSTRAINT     N   ALTER TABLE ONLY public.region
    ADD CONSTRAINT id_region PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.region DROP CONSTRAINT id_region;
       public            postgres    false    217            {           2606    16411    votante id_votante 
   CONSTRAINT     P   ALTER TABLE ONLY public.votante
    ADD CONSTRAINT id_votante PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.votante DROP CONSTRAINT id_votante;
       public            postgres    false    214            �           2606    16460    votante candidato_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.votante
    ADD CONSTRAINT candidato_id FOREIGN KEY (candidato_id) REFERENCES public.candidato(id) NOT VALID;
 >   ALTER TABLE ONLY public.votante DROP CONSTRAINT candidato_id;
       public          postgres    false    3197    214    215            �           2606    16450    votante comuna_id    FK CONSTRAINT     }   ALTER TABLE ONLY public.votante
    ADD CONSTRAINT comuna_id FOREIGN KEY (comuna_id) REFERENCES public.comuna(id) NOT VALID;
 ;   ALTER TABLE ONLY public.votante DROP CONSTRAINT comuna_id;
       public          postgres    false    214    3199    216            �           2606    16470    encuesta_votante encuesta_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.encuesta_votante
    ADD CONSTRAINT encuesta_id FOREIGN KEY (encuesta_id) REFERENCES public.encuesta(id) NOT VALID;
 F   ALTER TABLE ONLY public.encuesta_votante DROP CONSTRAINT encuesta_id;
       public          postgres    false    219    3203    218            �           2606    16455    comuna region_id    FK CONSTRAINT     |   ALTER TABLE ONLY public.comuna
    ADD CONSTRAINT region_id FOREIGN KEY (region_id) REFERENCES public.region(id) NOT VALID;
 :   ALTER TABLE ONLY public.comuna DROP CONSTRAINT region_id;
       public          postgres    false    217    3201    216            �           2606    16465    encuesta_votante votante_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.encuesta_votante
    ADD CONSTRAINT votante_id FOREIGN KEY (votante_id) REFERENCES public.votante(id) NOT VALID;
 E   ALTER TABLE ONLY public.encuesta_votante DROP CONSTRAINT votante_id;
       public          postgres    false    214    3195    219               )   x�3�LN�K�LI,�W0�2B�q#�L�x&\1z\\\ ?��         �  x�=V�r�8<C_�/�ŧ�����rm��i/�HpA����b?!�rH嶵7��v�\X�!H�L�� W�h;���Jm�Y��MT�]���T�ƛ�]v����*u�%�/ɨբV7��&��� K�v�5dw~���?����Zm��N��E�T7IG��\��V+��C�����*y�ޛ'�x\�O�Ĩ����R��q]�4�@�n���q�������b�&������{���:�iX-�C���
̧ �e[�ƫr�b���!(���"�DX"̋՗@P�7��3�Y�Xk�.���f���M���6�C\�q���{�X"G�$EU�"�+�`#�p+��q�'ǂ[��,�-~x1��Rw:���� �k�O&2	���}�hHl�{���\ѲV����R��=%�yL	6������+�ѢFR�A���$��?*K�h��
��죎1��zQ�ϽusNo�fY�pTe<���q�׋j	�뽓C������L��Ɵ��Po]�W�L?`I�����R7�)!�=Q�n{�I�d%�m��D��;����+�-3��� o�Dwȳ| dϺ;�z��&�/D�d�W��}8"^j���o\�H6H5�$?� /I2T�jg�%����SB���4��jm��w�5Jh��f)�2��D�;rg��t'�iM�����rf�	y��h������������g�U�u+4���w� 0E=9�,�%��
=�P<r���o�����C<��`*�G��0�l(�H=���4~�P`�E�N�J\��.��O�w����A'A�z��Y��uD�E�	�"�o{H&��r��Z6��}H��������3� ��1�n�X��:��8��� �r�����Y2m9h.C�"��rA�����$.�8�V�������/�X��F����0C-�	��5�s" �~��L�%P�L;�����7����0Y)Q{�,̊��i{U ��z7P�0f!C��'-�Z5����@���4iߡlf �
q0���ٲ���ʆ�����I~@Tbb�ߨ�<E��@����`�	l0
�E�_����ebML$``
.H-簛����uZB�i�޹-���B��H���_����y+h5�4�'��@�9�ii�e�cC��y��-��?YE������Q�bF&Md�214���!��34�N!�+"���w�U�__����:�F=��2��.�`������?&{I��ɔ�� 4����G��R��=�]
��K�ወ��
�c���kbT��7���d'؊@��Äד�� Z �������b�l�<�.�.+�_�f�K/gW@�t���d�4�il/�GĞ�N�	�0��I˭M��N�����Y��<�x��`��zp�~ڂ!!��ǯ(��ɘ㮄r����5r���+�!r��	ѳ�h-yZ�:���+u�xkv��6N�,bt>� �3���,���,���~�         1   x�3�,OM�2�,)�2�JMI-V�O�L�I-�2�t��L������ �         !   x�3�4�4�2��\�@҈�Hr��qqq 5��         �   x��=N1��S��C8@�I�F @T4ow�bə	���18BJ�=�/�C7OOg����9�gD/�5��#�r�%5��#RuV�d�8�״���:��#k��I���.G=j�38�
�����s1c�h���`�.
����я�������*?Sw�,m�veV�ja�����l��j2/�LlW����XSsJ�W�n*rD����P!��9�K�/��?���YM]�         G   x�3��/�I�K���-�˯�,��/�8�s�3R���s3s���s9-9�8��-�ML�b���� �^�     