<?php

namespace App\Form;

use App\Entity\Country;
use App\Entity\Person;
use App\Entity\Role;
use App\Entity\Team;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;

class PersonType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('firstname')
            ->add('middlenames')
            ->add('lastname')
            ->add('academictitle')
            ->add('photourl')
            ->add('nationality', EntityType::class, array("class"=> Country::class , "choice_label"=>"name"))
            ->add('teamid', EntityType::class, array("class"=> Team::class , "choice_label"=>"name"))
            ->add('roleid', EntityType::class, array("class"=> Role::class , "choice_label"=>"name"))
        ;
    }

    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults([
            'data_class' => Person::class,
        ]);
    }
}
