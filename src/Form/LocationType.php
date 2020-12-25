<?php

namespace App\Form;

use App\Entity\Location;
use App\Entity\Country;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;

class LocationType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('name')
            ->add('imageurl')
            ->add('maxaudiencecapacity')
            ->add('website')
            ->add('phone')
            ->add('email')
            ->add('street')
            ->add('streetno')
            ->add('postalcode')
            ->add('city')
            ->add('description')
            ->add('countryid', EntityType::class, array("class"=> Country::class , "choice_label"=>"name"))
        ;
    }

    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults([
            'data_class' => Location::class,
        ]);
    }
}
